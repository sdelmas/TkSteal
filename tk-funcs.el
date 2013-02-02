;;; Functions for the TkEmacs widget.
;;;
;;; $Header: tk-funcs.el[14.0] Sat Jan 20 12:54:57 1996 sven@(none) frozen $
;;;
;;; Functions meant to be exported:
;;;   - tk-get-buffer-string:  get contents (or part of it) of curr. buffer
;;;   - tk-delete-text:  delete contents (or part of it) of current buffer
;;;   - tk-insert-string:  insert string at specified position
;;;   - tk-translate-position:  translate position description to char. no.
;;;   - tk-set-cursor:  set cursor position
;;;   - tk-set-x-view:  set x position (start column) of window
;;;   - tk-set-y-view:  set y position (start row) of window
;;;   - tk-get-x-view-info:  get information about window position (x)
;;;   - tk-get-y-view-info:  get information about window position (y)
;;;   - tk-compare-index:  compare two bufer positions in tk format
;;;   - tk-current-line:  return number of current line (counts from 0)
;;;   - tk-reparent:  reparent x window id
;;;   - tk-set-background:  set background color
;;;   - tk-set-foreground:  set foreground color
;;;   - tk-set-cursor-background:  set cursor color
;;;   - tk-set-font:  set font
;;;   - tk-set-highlight-background:  set highlight background color
;;;   - tk-set-highlight-foreground:  set highlight foreground color
;;;   - tk-set-border-width:  set border width
;;; Functions meant to be private:
;;;   - tk-save-match-data (macro):  execute body and restore match-data
;;;   - tk-begins-with:  a "looking-at" for strings
;;; Variable:
;;;   - tk-previous-truncate-lines:  original value of truncate-lines
;;;   - tk-scrollbar-fixed-window:  use this window for tk-get{x,y}-view-info
;;;   - tk-buffer-size-cache:  data structure with buffer-size and no. of lines
;;;   - tk-emacs-type:  Type of Emacs this code runs on

(defconst tkemacs-copyright
  "Copyright (C) 1992 by Juergen Nickelsen <nickel@cs.tu-berlin.de>

This file is part of the TkEmacs widget.

This is free software; you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free
Software Foundation; either version 1, or (at your option) any later
version.

It is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
for more details.

You should have received a copy of the GNU General Public License
along with GNU Emacs; see the file COPYING.  If not, write to the Free
Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.
")

(provide 'tk-funcs)

(defconst tk-funcs-AtFS-Header
  "$Header: tk-funcs.el[9.1] Tue Nov  1 17:03:00 1994 garfield@mydomain.de frozen $")


;;; variables

(defvar tk-previous-truncate-lines 'not-yet-set
  "Previous value of truncate-lines for a buffer.
Is set by tk-set-x-view when called the first time for a buffer.
The default value of 'not-yet-set means tk-set-x-view has not yet
been called for this buffer.
Problem: if the user changes truncate-lines, the change will be undone
by the next call to tk-set-x-view, i.e. using the horizontal scroll bar.")

(make-variable-buffer-local 'tk-previous-truncate-lines)


(defvar tk-scrollbar-fixed-window nil
  "If non-nil, tk-get{x,y}-view-info use this window instead of the selected.
Meant to be set by the widget process.")

(defvar tk-buffer-size-cache '(nil 0 0 0)
  "Information about the size of a current buffer.
Set by tk-get-y-view-info.
First element is the buffer this is valid for,
second the size of this buffer at the previous call,
third the number of lines in this buffer,
fourth the number of the first window-line.")

(defconst tk-emacs-type
  (cond ((string-match "19.[1-9][0-9][.0-9]* Lucid" (emacs-version)) 'lucid-19New)
        ((string-match "19.[1-9][0-9][.0-9]* XEmacs Lucid" (emacs-version)) 'lucid-19New)
	((string-match "XEmacs 19.[1-9][0-9][.0-9]*" (emacs-version)) 'lucid-19New)
        ((string-match "Lucid" (emacs-version)) 'lucid-19)
        ((string-match "GNU Emacs 19.2[5-9]" (emacs-version)) 'gnu-19New)
        ((string-match "GNU Emacs 19.[3-9][0-9]" (emacs-version)) 'gnu-19New)
        ((string-match "GNU Emacs 19" (emacs-version)) 'gnu-19)
	((string-match "GNU Emacs 18" (emacs-version)) 'gnu-18)
	(t (error "Unknown Emacs type")))
  "Type of Emacs that runs this TkEmacs code.")

;;; uncomment this definition if you have problems reparenting emacs,
;;; and set the value to either:
;;;   'gnu-18
;;;   'gnu-19
;;;   'gnu-19New
;;;   'lucid-19
;;;   'lucid-19New
;;; so just play around and see which definition works for you.
;(defconst tk-emacs-type 'gnu-19New)


;;; utility functions

;; The following shamelessly stolen from ange-ftp -- I guess
;; I couldn't do it any better. The setting of case-fold-search isn't
;; needed here, so I took that out.
(defmacro tk-save-match-data (&rest body)
  "Execute the BODY forms, restoring the global value of the match data."
  (let ((original (make-symbol "match-data")))
    (list
     'let (list (list original '(match-data)))
     (list 'unwind-protect
           (cons 'progn body)
           (list 'store-match-data original)))))
;; should be indented like save-excursion etc.
(put 'tk-save-match-data 'lisp-indent-hook 0)


(defun tk-begins-with (regexp string)
  "Non-nil if REGEXP matches the beginning of STRING.
This is similar to looking-at, only for strings. Sets match-data."
  (string-match (concat "^" regexp) string))


(defun tk-translate-position (position)
  "Translate a Tk-like POSITION string to a buffer position.
POSITION begins with one of the following base-positions:
  - \"cursor\":        value of point
  - \"insert\":        value of point
  - \"top\":           beginning of buffer, value of \"(point-min)\"
  - \"end\":           end of buffer, value of \"(point-max)\"
  - \"linestart\":     beginning of the current line
  - \"lineend\":       end of the current line
  - \"wordstart\":     beginning of the current or previous word
  - \"wordend\":       end of the current or next word
  - \"[0-9]+.[0-9]+\": line, column -- both zero-based
A position may be modified by one or more modifiers:
  - \"[-+][0-9]+l\\(i\\(n\\(e\\(s|\\)|\\)|\\)|\\)\"
        n lines forward (backward if negative)
  - \"[-+][0-9]+c\\(h\\(a\\(r\\(s|\\)|\\)|\\)|\\)\"
        n chars farther (backward if negative)
There may be a blank ( == \" \") between a position and the modifier.
A complete position identifier is then
  position ::= base-position
  position ::= position [ BLANK ] modifier
I don't like this."
  (tk-save-match-data
    (let (result-position)

      ;; parse base position
      (cond ((or (tk-begins-with "cursor" position)
		 (tk-begins-with "insert" position))
	     (setq result-position (point)))
	    ((tk-begins-with "top" position)
	     (setq result-position (point-min)))
	    ((tk-begins-with "end" position)
	     (setq result-position (point-max)))
	    ((tk-begins-with "linestart" position)
	     (save-excursion
	       (beginning-of-line)
	       (setq result-position (point))))
	    ((tk-begins-with "lineend" position)
	     (save-excursion
	       (end-of-line)
	       (setq result-position (point))))
	    ((tk-begins-with "wordstart" position)
	     (save-excursion
	       (forward-word -1)
	       (setq result-position (point))))
	    ((tk-begins-with "wordend" position)
	     (save-excursion
	       (forward-word 1)
	       (setq result-position (point))))
	    ((tk-begins-with "\\([0-9]+\\)\\.\\([0-9]+\\)" position)
	     (let ((y (string-to-int (substring position
						(match-beginning 1)
						(match-end 1))))
		   (x (string-to-int (substring position
						(match-beginning 2)
						(match-end 2)))))
	       ;; to get as close as possible to the requested column,
	       ;; I do the following:
	       ;;   - move to end of line
	       ;;   - if column is too big, move backwards
	       ;;   - return (point)
	       (goto-line (1+ y))	; lines are zero-based
	       (end-of-line)
	       (let ((diff (- x (1+ (current-column)))))
		 (if (< diff 0)
		     (forward-char diff)))
	       (setq result-position (point))))
	    (t (tk-raise-error
		(format "Syntax error in position deskriptor \"%s\" %s"
			position "(base position)"))
	       (error "Syntax error in position deskriptor \"%s\" %s"
		      position "(base position)")))
      (setq position (substring position (match-end 0)))

      ;; parse modifiers
      (if (tk-begins-with " " position)
	  (setq position (substring position 1)))
      (while
	  (or
	   (tk-begins-with
	    "\\([-+][0-9]+\\)\\(l\\)\\(i\\(n\\(e\\(s\\|\\)\\|\\)\\|\\)\\|\\)"
	    position)
	   (tk-begins-with
	    "\\([-+][0-9]+\\)\\(c\\)\\(h\\(a\\(r\\(s\\|\\)\\|\\)\\|\\)\\|\\)"
	    position))
	(let ((number (string-to-int (substring position
						(match-beginning 1)
						(match-end 1)))))
	  (save-excursion
	    (goto-char result-position)
	    (if (eq (elt position (match-beginning 2)) ?\c)
		(forward-char number)
	      (forward-line number))
	    (setq result-position (point))))
	(setq position (substring position (match-end 0)))
	(if (tk-begins-with " " position)
	    (setq position (substring position 1))))
      (if (not (zerop (length position)))
	  (progn
	    (tk-raise-error
	     (format "Syntax error in position deskriptor \"%s\" %s"
		     position "(modifier)"))
	    (error "Syntax error in position deskriptor \"%s\" %s"
		   position "(modifier)")))
      result-position)))


(defun tk-compare-index (index1 op index2)
  "Compare two buffer positions in Tk format.
Args: INDEX1 OP INDEX2.
INDEX1 and INDEX2 are positions, OP is one of
\"==\", \"<=\", \">=\", \"=<\", \"=>\", \"<\", \">\", \"!=\".
Returns 1 for true, 0 for false."
  (let* ((pos1 (tk-translate-position index1))
	 (pos2 (tk-translate-position index2))
	 (result (cond ((equal op "==") (=  pos1 pos2))
		       ((equal op "<=") (<= pos1 pos2))
		       ((equal op "=<") (<= pos1 pos2))
		       ((equal op ">=") (>= pos1 pos2))
		       ((equal op "=>") (>= pos1 pos2))
		       ((equal op "!=") (not (=  pos1 pos2)))
		       ((equal op "<")  (<  pos1 pos2))
		       ((equal op ">")  (>  pos1 pos2))
		       (t (tk-raise-error
			   (format "illegal operator in tk-compare-index: %s"
				   op))))))
    (if result
	1
      0)))



;;; Read, write, and delete text

(defun tk-get-buffer-string (&optional pos1 pos2)
  "Return the contents of current buffer, optional from POS1 to POS2.
For the format of POS1 and POS2 see the documentation
of tk-translate-position."
  (if (not pos1)
      (setq pos1 "top"))
  (if (not pos2)
      (setq pos2 "end"))
  (buffer-substring (tk-translate-position pos1)
		    (tk-translate-position pos2)))


(defun tk-insert-string (position string)
  "At POSITION insert STRING.
For the format of POSITION see the documentation
of tk-translate-position."
  (save-excursion
    (tk-set-cursor position)
    (insert string)))


(defun tk-delete-text (&optional pos1 pos2 delete)
  "Kill text in buffer, optional from POS1 to POS2.
If optional third argument DELETE is non-nil, the text is deleted
instead of killed.
For the format of POS1 and POS2 see the documentation
of tk-translate-position.
Default value for POS1 is \"top\", for POS2 \"end\"."
  (if (not pos1)
      (setq pos1 "top"))
  (if (not pos2)
      (setq pos2 "end"))
  (if delete
      (delete-region (tk-translate-position pos1)
		     (tk-translate-position pos2))
    (kill-region (tk-translate-position pos1)
		 (tk-translate-position pos2))))


;;; scrollbar fixing

(defun tk-fix-scrollbars-to-window (&optional notify window)
  "Make tk-get-{x,y}-view-info use the now selected window.
This has the effect that the scrollbars always move this window even
if another one has been selected.
If optional argument NOTIFY is non-nil, a message is given.
Second optional argument WINDOW can specify a window to use.
WARNING: This does not yet work correctly."
  (let ((window (or window (selected-window))))
    (setq tk-scrollbar-fixed-window window)
    (if notify
	(message "Scrollbars fixed to %s" tk-scrollbar-fixed-window))))


(defun tk-release-scrollbars (&optional notify)
  "Make tk-get-{x,y}-view-info always use the selected window.
If optional argument NOTIFY is non-nil, a message is given."
  (setq tk-scrollbar-fixed-window nil)
  (tk-notify-x-view-change)
  (tk-notify-y-view-change)
  (if notify
      (message "Scrollbars released")))


;;; Set cursor position, set view, get view info

(defun tk-set-cursor (position)
  "Set point to POSITION.
For the format of POSITION see the documentation
of tk-translate-position."
  (goto-char (tk-translate-position position))
  (tk-notify-y-view-change))


(defun tk-get-y-view-info (&optional rescan)
  "Get information about the current position of the selected window in buffer.
Tries to cache some information to speed up scrollbars.
If optional argument RESCAN is non-nil, line counting is enforced.
Returns a string with four numbers:
  - total units (number of lines in buffer)
  - window units (number of lines in window)
  - first unit (number of first window line)
  - last unit (number of last window line)."
  (let ((window (or tk-scrollbar-fixed-window
		    (selected-window))))
    (save-excursion
      (let ((buffer (window-buffer window)))
	(set-buffer buffer)
	(let ((window-units (1- (window-height window)))
	      (buffer-size (buffer-size))
	      total-units first-unit last-unit y-view-info)
	  (if (and (eq buffer (car tk-buffer-size-cache))
		   (eq buffer-size (cadr tk-buffer-size-cache))
		   (not rescan))
	      ;; rescan is nil, buffer and its size are the same,
	      ;; so we can use the cached information
	      (progn (setq total-units (caddr tk-buffer-size-cache))
		     (setq first-unit (cadddr tk-buffer-size-cache)))
	    ;; rescan is non-nil or something has changed,
	    ;; so we have to count the lines again
	    (save-excursion
	      ;; (tk-send-command "puts stdout counting")
	      (move-to-window-line 0)
	      (setq first-unit (count-lines (point-min) (point)))
	      (setq total-units (+ first-unit
				   (count-lines (point) (point-max)))))
	    (setq tk-buffer-size-cache
		  (list buffer buffer-size total-units first-unit)))
	  (setq last-unit (max (+ first-unit window-units -1)
			       window-units))
	  (setq y-view-info
		(format "%d %d %d %d" total-units
			window-units first-unit last-unit))
	  y-view-info)))))


(defun tk-current-line ()
  "Return the number of the current line. The first line is line 0."
  ;; stolen from (what-line)
  (interactive)
  (let ((current-line (save-excursion
			(beginning-of-line)
			(count-lines (point-min) (point)))))
    current-line))


(defun tk-get-x-view-info ()
  "Get information about the current position of the selected window in buffer.
Returns a string with four numbers:
  - total units (a faked number of columns in buffer)
  - window units (number of columns in window)
  - first unit (number of first window column)
  - last unit (number of last window column)
These figures depend on the value of truncate-lines and
truncate-partial-width-windows."
  (let ((window (or tk-scrollbar-fixed-window
		    (selected-window))))
    (save-excursion
      (set-buffer (window-buffer window))
      (let* ((width (window-width window))
	     (window-units width)
	     (first-unit (window-hscroll window))
	     total-units last-unit)
	(if (or truncate-lines
		(and truncate-partial-width-windows
		     (< width (screen-width))))
	    (progn (setq total-units (+ first-unit (* 3 width))) ; faked
		   (setq last-unit (+ first-unit width -1)))
	  (progn (setq total-units width)
		 (setq last-unit width)))
	(if (interactive-p)
	    (message "total %d, window %d, first %d, last %d"
		     total-units window-units first-unit last-unit)
	  (format "%d %d %d %d"
		  total-units window-units first-unit last-unit))))))


(defun tk-set-x-view (column)
  "Set x view (i.e. hscroll) of selected or fixedwindow to COLUMN.
First column is col. 0 in Tk-speak."
  (if (eq tk-previous-truncate-lines 'not-yet-set)
      (setq tk-previous-truncate-lines truncate-lines))
  (if (<= column 0)
      (progn (setq truncate-lines tk-previous-truncate-lines)
	     (setq column 0))
    (setq truncate-lines t))
  ;; set-window-hscroll calls tk-notify-x-view-change
  (set-window-hscroll (or tk-scrollbar-fixed-window
			  (selected-window))
		      column))


(defun tk-set-y-view (line)
  "Set y view of selected or fixed window to LINE (zero-based).
LINE is set the first line of the window."
  (save-excursion
    (set-buffer (window-buffer (or tk-scrollbar-fixed-window
				   (selected-window))))
    (setq line (max 0 line))
    ;; we have to care for narrowing here, so we can't use goto-line
    (goto-char (point-min))
    (forward-line line)			; line numbers are zero-based

    (setcar (cdddr tk-buffer-size-cache) line) ; set first-unit
    (tk-original-recenter 0)		; no redisplay of widget here
    (tk-notify-y-view-change)))
  


;;; some other goodies 

(defun tk-reparent ()
  "Reparent emacs window."
  (let ((emacs-version-string (emacs-version)))
  (cond ((eq tk-emacs-type 'lucid-19New)
         (tk-send-command (format "%s reparent2 %s"
				  tk-widget-name
				  (x-window-id
				   (selected-screen)))))
       ((eq tk-emacs-type 'lucid-19)
         (tk-send-command (format "%s reparent3 %s"
				  tk-widget-name
				  (x-window-id
				   (selected-screen)))))
        ((eq tk-emacs-type 'gnu-19New)
         (tk-send-command (format "%s reparent2 %s"
			     tk-widget-name
			     (cdr (assq 'window-id (frame-parameters 
						    (selected-frame)))))))
        ((eq tk-emacs-type 'gnu-19)
         (tk-send-command (format "%s reparent0 %s"
			     tk-widget-name
			     (cdr (assq 'window-id (frame-parameters 
						    (selected-frame)))))))
        (t
         ;; every other Emacs running as TkEmacs is expected to have this
         (tk-send-command (format "%s reparent" tk-widget-name))))))

(defun tk-get-buffer-list ()
  "Return a list with all buffer names not beginning with a blank.
(Buffer names beginning with a blank are names of  hidden buffers,
e.g. Minibuffers.)"
  (let ((names (mapcar 'buffer-name (buffer-list)))
	(zwerg ()))
    (while names
      (if (not (string-match "^ " (car names)))
	  (setq zwerg (cons (car names) zwerg)))
      (setq names (cdr names)))
    (nreverse zwerg)))

;;; some functions to manipulate resources
;;; setting colors, font, cursor, and border width
;;; The differences between GNU Emacs 18, GNU 19, and Lucid Emacs 19
;;; have to be taken into account.

(defun tk-set-background (color)
  "Set background color."
  (cond ((eq tk-emacs-type 'lucid-19New)
	 (set-face-background 'default color))
	((eq tk-emacs-type 'lucid-19)
	 (set-face-background 'default color))
	((eq tk-emacs-type 'gnu-19New)
	 (set-background-color color))
	((eq tk-emacs-type 'gnu-19)
	 (set-background-color color))
	((eq tk-emacs-type 'gnu-18)
	 (x-set-background-color color))))

(defun tk-set-foreground (color)
  "Set foreground color."
  (cond ((eq tk-emacs-type 'lucid-19New)
	 (set-face-foreground 'default color))
        ((eq tk-emacs-type 'lucid-19)
	 (set-face-foreground 'default color))
	((eq tk-emacs-type 'gnu-19New)
	 (set-foreground-color color))
	((eq tk-emacs-type 'gnu-19)
	 (set-foreground-color color))
	((eq tk-emacs-type 'gnu-18)
	 (x-set-foreground-color color))))

(defun tk-set-cursor-background (color)
  "Set cursor color."
  (cond ((eq tk-emacs-type 'lucid-19New))
        ((eq tk-emacs-type 'lucid-19)
         (set-cursor-color color))
        ((eq tk-emacs-type 'gnu-19New)
         (set-cursor-color color))
        ((eq tk-emacs-type 'gnu-19)
         (set-cursor-color color))
        ((eq tk-emacs-type 'gnu-18)
         (x-set-cursor-color color))))

(defun tk-set-highlight-background (color)
  "Set highlight background color."
  (cond ((eq tk-emacs-type 'lucid-19New)
         (set-face-background 'primary-selection color))
        ((eq tk-emacs-type 'lucid-19)
         (set-face-background 'primary-selection color))
        ((eq tk-emacs-type 'gnu-19New)
         (set-face-background 'highlight color))
        ((eq tk-emacs-type 'gnu-19)
         (set-face-background 'highlight color))
        ((eq tk-emacs-type 'gnu-18)
	 ;; Emacs 18 does not highlight
	 )))

(defun tk-set-highlight-foreground (color)
  "Set highlight foreground color."
  (cond ((eq tk-emacs-type 'lucid-19New)
         (set-face-foreground 'primary-selection color))
        ((eq tk-emacs-type 'lucid-19)
         (set-face-foreground 'primary-selection color))
        ((eq tk-emacs-type 'gnu-19New)
         (set-face-foreground 'highlight color))
        ((eq tk-emacs-type 'gnu-19)
         (set-face-foreground 'highlight color))
        ((eq tk-emacs-type 'gnu-18)
	 ;; Emacs 18 does not highlight
         )))

(defun tk-set-font (font)
  "Set font."
  (cond ((eq tk-emacs-type 'lucid-19New)
         (set-face-font  'default font))
        ((eq tk-emacs-type 'lucid-19)
         (set-default-font font))
        ((eq tk-emacs-type 'gnu-19New)
         (set-default-font font))
        ((eq tk-emacs-type 'gnu-19)
         (set-default-font font))
        ((eq tk-emacs-type 'gnu-18)
         (x-set-font font))))

(defun tk-set-border-width-to-zero ()
  "Set border width to zero."
  (cond ((eq tk-emacs-type 'lucid-19New))
        ((eq tk-emacs-type 'lucid-19))
        ((eq tk-emacs-type 'gnu-19New))
        ((eq tk-emacs-type 'gnu-19))
        ((eq tk-emacs-type 'gnu-18)
         (x-set-border-width 0)
         (x-set-internal-border-width 0))))

;; end of file
