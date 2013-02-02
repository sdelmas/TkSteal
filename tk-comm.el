;;; Communication and interface routines for the TkEmacs widget
;;;
;;; $Header: tk-comm.el[14.0] Wed Aug  2 11:12:17 1995 sven@(none) frozen $
;;;
;;; Functions meant to be exported:
;;;   - tk-advise-destroy-widget-on-exit:  make Emacs destroy widget on exit
;;;   - tk-kill-emacs:  terminate widget properly
;;;   - tk-redraw-display:  redraw widget
;;;   - tk-send-command:  send Tcl command to widget
;;;   - tk-raise-error:  send error message to widget
;;;   - tk-recenter, recenter:  modified "recenter" function
;;;   - tk-redraw-display, redraw-display:  modified "redraw-display" function
;;;   - tk-activate-view-change-notification:  swith notify on
;;;   - tk-deactivate-view-change-notification:  switch notify off
;;; Functions meant to be private:
;;;   - tk-advise-change-view-functions:  make functions inform about view
;;;   - tk-unadvise-change-view-functions:  cancel the latter
;;;   - tk-complete-input-line-p:  t if complete line has arrived
;;;   - tk-queue-controller-input:  add string to input buffer
;;;   - tk-initialize-communication:  initialize variables and functions
;;;   - tk-get-input-line:  get line from input buffer
;;;   - tk-erase-input-buffer:  delete contents of input buffer
;;;   - tk-notify-x-view-change:  notify widget that x view on buffer changed
;;;   - tk-notify-y-view-change:  notify widget that y view on buffer changed
;;;   - tk-get-command-line-args:  parses command line arguments
;;;   - tk-connect-to-controller:  open connection to widget
;;;   - tk-shutdown-controller:  close connection to widget
;;;   - tk-controller-filter :  handles incoming string from widget
;;;   - tk-send-return-value:  send Lisp object to widget
;;;   - tk-send-raw-string:  send string to widget (without protocol)
;;;   - tk-string-format:  formats string suitable for protocol with widget
;;;   - tk-log-to-buffer:  logs communication with widget
;;;   - tk-kill-emacs-hook:  to be placed into kill-emacs-hook
;;;   - tk-original-recenter:  original "recenter" function
;;;   - tk-original-redraw-display:  original "redraw-display" function
;;;   - tk-original-goto-line:  original "goto-line" function
;;; Variables:
;;;   - tk-widget-name:  name of this TkEmacs widget
;;;   - tk-write-back-eval:  if non-nil, write back evaluation results
;;;   - tk-controller-port:  port of remote controller
;;;   - tk-controller-host:  host of remote controller
;;;   - tk-log-communication:  if non-nil, log communication
;;;   - tk-log-buffer-name:  name of buffer where communication is logged
;;;   - kill-emacs-hook:  to be executed on exit.
;;;   - tk-change-x-view-functions:  functions changing x view on buffer
;;;   - tk-change-y-view-functions:  functions changing x view on buffer
;;;   - tk-comm-initialized:  if t, variables etc. have been initialized
;;;   - tk-controller-input-buffer-name:  name of input buffer
;;;   - tk-controller-input-queue:  string collecting input from buffer
;;;   - tk-controller-process:  process variable for the connection
;;;   - tk-default-port:  network port number, for interactive use
;;;   - tk-signal-errors:  if non-nil, signal errors to the user
;;;   - tk-notify-view-changes-p:  if non-nil, notify widget of view changes
;;; Hooks:
;;;   - tk-initialization-hooks: Run when variables etc. have been initialized
;;;   - tk-connect-hooks: Run when connection has been established


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

(require 'cl)
(require 'tk-app-hooks)
(provide 'tk-comm)


;;; Variables

(defconst tk-comm-AtFS-Header
  "$Header: tk-comm.el[14.0] Wed Aug  2 11:12:17 1995 sven@(none) frozen $")

(defvar tk-comm-initialized nil
  "If non-nil, the Tk communication module has already been initialized.")

(defvar tk-log-communication nil
  "If non-nil, the communication between Emacs and the Tk widget is
logged in tk-log-buffer.")

(defvar tk-log-buffer-name " *tk-log*"
  "Name of the buffer where Tk communication is logged.
Begins with a blank to be invisible.")

(defvar tk-log-buffer nil
  "Buffer where Tk communication is logged.
If it gets killed, it will be re-created on demand.")

(defvar tk-controller-input-buffer-name " *tk-input*"
  "Name of buffer containing incoming characters, not yet processed.")

(defvar tk-controller-input-queue ""
  "Incoming lines that have not yet been processed.")

(defvar tk-controller-process nil
  "Process variable of tk-controller process
(really a network connection).")

(defvar tk-controller-host nil
  "Hostname of remote tk-controller.")

(defvar tk-controller-port nil
  "Port number of remote tk-controller.")

(defvar tk-write-back-eval t
  "If non-nil, write results of evaluations back to the tk-controller.")

(defvar tk-widget-name "dummy-widget"
  "Name of the widget we talk to in the remote tk-controller.")

(defvar tk-kill-widget-on-exit nil
  "If non-nil, Emacs kills the widget on exit.")

(defvar tk-default-port "2957"
  "Default port number for connecting to the controller,
if not given in the command line. Mostly for testing purposes.
Must be a string because it is used as initial input for read-string.")

(defvar tk-signal-errors t
  "If non-nil, signal errors in the process-filter to the user.
If nil, rely on the widget to process the error.")

(defconst tk-change-y-view-functions '(scroll-up
				       scroll-down
				       newline
				       beginning-of-buffer
				       end-of-buffer
				       recenter
				       redraw-display
				       insert-buffer
				       insert-file
				       kill-region
				       switch-to-buffer
				       revert-buffer
				       bury-buffer
				       kill-buffer
				       pop-to-buffer
				       find-tag
				       next-line
				       previous-line
				       goto-line
				       delete-window
				       delete-other-windows
				       enlarge-window-horizontally
				       enlarge-window
				       shrink-window-horizontally
				       shrink-window
				       other-window
				       scroll-other-window
				       forward-page
				       forward-paragraph
				       split-window
				       x-flush-mouse-queue)
  "List of functions that significantly change y view on current buffer.
These functions have to be advised to inform the TkEmacs widget about
the change.")

(defconst tk-change-x-view-functions '(recenter
				       redraw-display
				       set-window-hscroll
				       scroll-left
				       scroll-right
				       x-flush-mouse-queue)
  "List of functions that significantly change x view on current buffer.
These functions have to be advised to inform the TkEmacs widget about
the change.")

(defvar tk-notify-view-changes-p t
  "If non-nil, the controller process is notified of view changes in
Emacs' buffer. Used by tk-notify-x-view-change and tk-notify-y-view-change,
set by tk-activate-view-change-notification and
tk-deactivate-view-change-notification.")


;;; Functions for handling tk-controller-input-buffer

(defun tk-erase-input-buffer ()
  "Erase tk-controller-input-buffer, i.e. flush all input."
  (save-excursion
    (set-buffer (get-buffer-create tk-controller-input-buffer-name))
    (erase-buffer)))


(defun tk-queue-controller-input (string)
  "Add input STRING to tk-controller-input-buffer."
  (save-excursion
    (set-buffer (get-buffer-create tk-controller-input-buffer-name))
    (goto-char (point-max))
    (insert string)))


(defun tk-complete-input-line-p ()
  "Return non-nil if a complete line is available in
tk-controller-input-buffer."
  (save-excursion
    (set-buffer (get-buffer-create tk-controller-input-buffer-name))
    (goto-char 1)			; don' bother with point-min here
    (forward-line 1)
    (and (bolp)
	 (not (bobp)))))


(defun tk-get-input-line ()
  "Return the first line from tk-controller-input-buffer and erase it there."
  (save-excursion
    (set-buffer (get-buffer-create tk-controller-input-buffer-name))
    (goto-char 1)
    (let ((end (progn (forward-line 1)
		      (point))))
      (prog1
	  (buffer-substring 1 end)
	(delete-region 1 end)))))



;;; Functions etc. to set up, continue, and shut down communication
;;; to the TkEmacs widget

(defun tk-get-command-line-args (switch)
  "Consume commandline arguments after \"-tkwidget\" and connect
to remote tk-controller. Arguments are:
  - tk-widget-name
  - tk-controller-host
  - tk-controller-port"
  (if (equal switch "-tkwidget")
      (progn
	(setq tk-widget-name
	      (car command-line-args-left))
	(setq tk-controller-host
	      (cadr command-line-args-left))
	(setq tk-controller-port
	      (string-to-int (caddr command-line-args-left)))
	(setq command-line-args-left
	      (cdddr command-line-args-left))
	(tk-connect-to-controller tk-controller-host tk-controller-port))))


(defun tk-connect-to-controller (host port)
  "Establish a connection to a remote tk-controller on HOST port PORT.
This function is a command only for testing purposes."
  (interactive (list (read-string "To host: " "localhost")
		     (string-to-int (read-string "Port: "
						 tk-default-port))))
  (if tk-controller-process
      ;; there must not be two controllers
      (error "Tk-Controller already running on host %s port %s"
	     tk-controller-host tk-controller-port)
    ;; set up process and associated variables
    (setq tk-controller-process
	  (open-network-stream "tk-controller-process" nil host port))
    (setq tk-controller-host host)
    (setq tk-controller-port port)
    (tk-erase-input-buffer)
    (set-process-filter tk-controller-process 'tk-controller-filter)
    (set-process-sentinel tk-controller-process 'tk-shutdown-controller)
    ;; first handshake
    (tk-send-return-value "Hello widget, pleased to meet you!")
    (tk-reparent)
    (tk-notify-x-view-change)
    (tk-notify-y-view-change)
    (run-hooks 'tk-connect-hooks)
    (if (interactive-p)
	(message "Connection established."))
    tk-controller-process))


(defun tk-shutdown-controller (&optional proc message)
  "Sentinel for the connection to a remote tk-controller.
This is a command only for testing purposes.
Since the only status change is connection loss, the only action to
be done is cleaning up.
Optional arguments: PROC MESSAGE.
If PROC is nil, no message is given."
  (interactive "p")
  (if proc
      (message "Tk-Controller on %s port %d shutdown."
	       tk-controller-host tk-controller-port))
  (condition-case dummy
      ;; this closes the network connection. Errors must be ignored,
      ;; because the connection will already be closed if this
      ;; function is called as the process sentinel.
      (delete-process tk-controller-process)
    (error nil))
  ;; reset associated variables
  (setq tk-controller-process nil)
  (setq tk-controller-port nil)
  (setq tk-controller-host nil)
  (if proc
      ;; proc is non-nil if this function has been called as the
      ;; sentinel or if the user wants it.
      (ding)))


(defun tk-controller-filter (proc string)
  "Filter for the connection to a remote tk-controller.
It relies on the messages coming in line by line,
perhaps this is a bug, we'll see."
  ;; log to buffer if requested
  (tk-log-to-buffer "recv" string)
  ;; collect a complete line first
  (tk-queue-controller-input string)
  ;; line complete?
  (while (tk-complete-input-line-p)
      (condition-case error-message
	  (let ((line (tk-get-input-line)))
	    (if (< (length line) 5)	; including newline character
		;; line is too short
		(progn (tk-erase-input-buffer)
		       (tk-raise-error "line too short"))
	      ;; The message type tokens are four characters long
	      (let ((token (substring line 0 4)))
		;; switch according to the type of token. 
		(cond ((equal token "RST:")
		       ;; reset communication. All input is flushed.
		       (setq tk-controller-input-queue "")
		       (tk-erase-input-buffer))
		      
		      ((equal token "CMD:")
		       ;; command lines are collected in
		       ;; tk-controller-input-queue 
		       (setq tk-controller-input-queue
			     (concat tk-controller-input-queue
				     (substring line 5))))
		      
		      ((equal token "END:")
		       ;; end of command. Now the command in
		       ;; tk-controller-input-queue can be executed
		       (let ((exp (read tk-controller-input-queue))
			     value)
			 ;; it is important to clear the input queue
			 ;; immmediately since the filter can be
			 ;; invoked in parallel
			 (setq tk-controller-input-queue "")
			 (setq value (eval exp))
			 ;; write result back only if requested
			 (if tk-write-back-eval
			     (tk-send-return-value value))))
		      
		      ((equal token "RET:")
		       ;; should not appear (yet). Will perhaps later be
		       ;; needed.
		       (tk-raise-error "protocol error: ret received"))
		      
		      ((equal token "ERR:")
		       ;; is error message from Tk widget
		       (progn (message "Tk error: %s"
				       (substring string 5
						  (1- (length string))))
			      (ding)))
		      
		      (t
		       ;; an unrecognized token occurred
		       (tk-raise-error (format "protocol error, token \"%s\""
					       (substring string 0 4)))
		       (setq tk-controller-input-queue "")))
		;; reset input line, this one has been processed.
		(setq line ""))))
	(quit
	 (progn (setq tk-controller-input-queue "")
		(tk-erase-input-buffer)
		(ding)
		(message "Quit")
		(tk-raise-error error-message)))
	(error
	 ;; any error is given to controller
	 (progn (setq tk-controller-input-queue "")
		(tk-raise-error error-message)
		(if tk-signal-errors
		    (signal (car error-message) (cdr error-message))))))))


;;; Functions to synchronize termination and redisplay

(defun tk-kill-emacs ()
  "Function for Tk to shut down the TkEmacs widget.
For some unknown reason this must include the action which is already
placed in kill-emacs-hook."
  (if tk-controller-process
      (tk-shutdown-controller))
  ;; this must not happen twice, so reset kill-emacs-hook
  (setq kill-emacs-hook nil)
  (kill-emacs))


(defun tk-advise-destroy-widget-on-exit ()
  "Advise Emacs to destroy the widget on exit. Does not yet work.
This is necessary for TkEmacs."
  (setq tk-kill-widget-on-exit t))


(defun tk-kill-emacs-hook ()
  "To be put into kill-emacs-hook in order to guarantee proper
shutdown of the TkEmacs widget."
  ;; notify widget of Emacs' death
  (if tk-kill-widget-on-exit
    (if tk-controller-process
      (tk-send-command (format "%s stopemacs; catch {destroy .}; catch {exit 0}" tk-widget-name))))
  (tk-shutdown-controller))


(defun tk-recenter (&optional arg)
  "Center point in window and redisplay screen.  With ARG, put point on line ARG.
The desired position of point is always relative to the current window.
Just C-u as prefix means put point in the center of the screen.
No arg (i.e., it is nil) erases the entire screen and then
redraws with point in the center.
This function has been modified to work with the TkEmacs widget."
  (interactive "P")
  (tk-original-recenter arg)
  ;; the widget must now redisplay the Emacs frame
  (if (and tk-controller-process
	   (not arg))
      (tk-send-command (format "%s redisplay" tk-widget-name))))


(defun tk-redraw-display ()
  "Clear the screen and output again what is supposed to appear on it.
This function has been modified to work with the TkEmacs widget."
  (interactive)
  (tk-original-redraw-display)
  ;; the widget must now redisplay the Emacs frame
  (if tk-controller-process
      (tk-send-command (format "%s redisplay" tk-widget-name))))



;;; Functions concerned with keeping the widget informed about the
;;; current view on the buffer

;; switch view change notification on and off

(defun tk-activate-view-change-notification ()
  "Make TkEmacs notify the controller of view changes in Emacs' buffer
by setting the variable `tk-notify-view-changes-p' to t."
  (setq tk-notify-view-changes-p t))


(defun tk-deactivate-view-change-notification ()
  "Make TkEmacs not notify the controller of view changes in Emacs' buffer
by setting the variable `tk-notify-view-changes-p' to nil."
  (setq tk-notify-view-changes-p nil))


(defun tk-notify-x-view-change ()
  "Notify TkEmacs widget that x view on buffer in selected window changed.
This function is meant to be invoked each time when a major change in
the view has occured."
  (if tk-notify-view-changes-p
      (tk-send-command (format "%s setxscroll %s"
			       tk-widget-name
			       (tk-get-x-view-info)))))


(defun tk-notify-y-view-change (&optional rescan)
  "Notify TkEmacs widget that y view on buffer in selected window changed.
This function is meant to be invoked each time when a major change in
the view has occured.
Optional argument RESCAN is passed to tk-get-y-view-info."
  (if tk-notify-view-changes-p
      (tk-send-command (format "%s setyscroll %s"
			       tk-widget-name
			       (tk-get-y-view-info rescan)))))


(require 'advice)

(defun tk-advise-change-view-functions ()
  "Advise functions in tk-change-{x,y}-view-functions to call
tk-notify-{x,y}-view-change."
  (let ((flist tk-change-x-view-functions))
    (while flist
      (if (fboundp (car flist))
	  (eval (list 'defadvice (car flist) (list 'after (make-symbol (format "tk-advise-x-%s" (car flist))) 'activate)
		      "Tk-advice"
		      '(tk-notify-x-view-change))))
      (setq flist (cdr flist))))
  (let ((flist tk-change-y-view-functions))
    (while flist
      (if (fboundp (car flist))
	  (eval (list 'defadvice (car flist) (list 'after (make-symbol (format "tk-advise-y-%s" (car flist))) 'activate)
		      "Tk-advice"
		      '(tk-notify-y-view-change t))))
      (setq flist (cdr flist)))))


(defun tk-unadvise-change-view-functions ()
  "Unadvise functions in tk-change-{x,y}-view-functions
to call tk-notify-{x,y}-view-change."
  (ad-disable-regexp "^tk-advise-"))

;(require 'tk-advise)

;(defun tk-advise-change-view-functions ()
;  "Advise functions in tk-change-{x,y}-view-functions to call
;tk-notify-{x,y}-view-change."
;  (let ((flist tk-change-x-view-functions))
;    (while flist
;      (if (fboundp (car flist))
;          (eval (list 'tk-advise (car flist) ':after
;                      '(tk-notify-x-view-change))))
;      (setq flist (cdr flist))))
;  (let ((flist tk-change-y-view-functions))
;    (while flist
;      (if (fboundp (car flist))
;          (eval (list 'tk-advise (car flist) ':after
;                      '(tk-notify-y-view-change t))))
;      (setq flist (cdr flist)))))


;(defun tk-unadvise-change-view-functions ()
;  "Unadvise functions in tk-change-{x,y}-view-functions
;to call tk-notify-{x,y}-view-change."
;  (let ((flist tk-change-x-view-functions))
;    (while flist
;      (tk-unadvise (car flist))
;      (setq flist (cdr flist))))
;  (let ((flist tk-change-y-view-functions))
;    (while flist
;      (tk-unadvise (car flist))
;      (setq flist (cdr flist)))))



;;; Functions to implement the protocol between Emacs and the widget

(defun tk-send-command (string)
  "Send STRING as Tcl command to remote tk-controller."
  (interactive "sSend Tcl command: ")
  (tk-send-raw-string (tk-string-format 'cmd "%s" string)))


(defun tk-send-return-value (object)
  "Send OBJECT as a return value to the tk-controller.
OBJECT can be any Lisp object."
  (tk-send-raw-string (tk-string-format 'ret "%s" object)))


(defun tk-raise-error (message)
  "Send MESSAGE as an error message to the tk-controller."
  (condition-case dummy
      (tk-send-raw-string (tk-string-format 'err "%s" message))
    (error nil)))


(defun tk-send-raw-string (string)
  "Send STRING to remote tk-controller. Do not use this
unless you really know what you are doing, since this function
lies below the protocol between Emacs and the tk-controller."
  (if tk-controller-process
      (progn (process-send-string tk-controller-process string)
	     (tk-log-to-buffer "send" string))))


(defun tk-string-format (type &rest format-args)
  "Format string suitable for transmission to the tk widget.
TYPE may be 'ret or 'cmd or 'err, remaining FORMAT-ARGS are
processed by format."
  (let ((tmp-buffer (get-buffer-create " *tk-temp-send*"))
	(header (cdr (or (assoc type '((ret . "RET: ")
				       (cmd . "CMD: ")
				       (rst . "RST: ")
				       (err . "ERR: ")))
			 (error "Wrong TYPE parameter %s" type)))))
    (save-excursion
      ;; insert formatted string into a buffer
      (set-buffer tmp-buffer)
      (erase-buffer)
      (insert (apply 'format format-args))
      (goto-char 0)
      ;; insert appropriate header at line beginnings
      (while (not (eobp))
	(insert header)
	(forward-line 1))
      ;; if the last char was a newline, another header is needed
      (if (bolp)
	  (insert header))
      (insert (if (eq type 'err)
		  "\n"
		"\nEND:\n"))
      ;; return string
      (buffer-string))))


(defun tk-log-to-buffer (where string)
  "Log communication to buffer, if tk-log-communication is non-nil.
WHERE is \"recv\" or \"send\", STRING is the message.
See also tk-log-buffer and tk-log-buffer-name."
  (if tk-log-communication
      (save-excursion
	(set-buffer (get-buffer-create tk-log-buffer-name))
	(goto-char (point-max))
	(insert (format "##%s: %s##\n" where string)))))


;;; init

(defun tk-initialize-communication ()
  "Initialize certain variables and functions for the communication
with the TkEmacs widget."
  (if (not tk-comm-initialized)
      (progn
	;; set the redisplay functions to ours, but only once
	(if (not (fboundp 'tk-original-redraw-display))
	    (progn
	      (fset 'tk-original-goto-line (symbol-function 'goto-line))
	      (fset 'tk-original-recenter (symbol-function 'recenter))
	      (fset 'recenter (symbol-function 'tk-recenter))
	      (fset 'tk-original-redraw-display
		    (symbol-function 'redraw-display))
	      (fset 'redraw-display (symbol-function 'tk-redraw-display))))
	;; Test dummy, to be used if the controller is not the real widget
	(if (not (fboundp 'tk-get-event-window))
	    (defun tk-get-event-window () nil))
	;; the "-tkwidget" switch must be parsed by tk-get-command-line-args
	(setq command-switch-alist
	      (cons '("-tkwidget" . tk-get-command-line-args)
		    command-switch-alist))
	(setq kill-emacs-hook 'tk-kill-emacs-hook)
	(tk-advise-change-view-functions)
	(setq tk-comm-initialized t)
	(run-hooks 'tk-initialization-hooks))))


;;; end of file
