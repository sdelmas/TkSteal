;;; Load file for TkEmacs widget support
;;;
;;; $Header: tkemacs.el[14.0] Fri Dec  9 03:19:36 1994 garfield@mydomain.de frozen $
;;; 
;;;
;;; All files for the TkEmacs widget are loaded from here:
;;;   - tk-comm.el:  Communication and interface support
;;;   - tk-funcs.el:  Functions for widget

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

(defconst tkemacs-AtFS-Header
  "$Header: tkemacs.el[14.0] Fri Dec  9 03:19:36 1994 garfield@mydomain.de frozen $")

;; To disable the menubar under emacs 19 uncomment the following line
;(menu-bar-mode 0)

;; To disable the menubar under xemacs 19 uncomment the following line
;(setq current-menubar ())

(require 'tk-comm)
(require 'tk-funcs)

(tk-initialize-communication)
