;;; From kevin@edscom.demon.co.uk Tue Sep  8 18:17:39 1992
;;; Newsgroups: gnu.emacs.sources
;;; From: kevin@edscom.demon.co.uk (Kevin Broadey)
;;; Subject: Re: Function to simplify additions to hook lists
;;; In-Reply-To: kevin@edscom.demon.co.uk's message of Wed, 2 Sep 1992 10:29:29 GMT
;;; Organization: EDS-Scicon, Milton Keynes, UK
;;; Distribution: gnu
;;; Date: Wed, 2 Sep 1992 15:16:47 GMT
;;; 
;;; >>>>> In article <KEVIN.92Sep2102929@runningbear.edscom.demon.co.uk>,
;;; >>>>> "Me" == kevin@edscom.demon.co.uk (Kevin Broadey) writes:
;;; 
;;; Me> As I got into customising more and more packages, my .emacs file was
;;; Me> getting more and more cluttered with code to safely set up all the
;;; Me> hook lists I needed.
;;; 
;;; Me> The big problem with adding functions to hooks is that if a hook is
;;; Me> already defined, the new function must be added differently
;;; Me> depending on whether the current value is a symbol, a LAMBDA
;;; Me> expression, or a list containing instances of either.
;;; 
;;; Me> Things came to a head this morning when I realised I'd missed one of
;;; Me> these cases in several places, causing calls to `run-hooks' to fail.
;;; 
;;; Me> Below is my solution to the problem.  It ought to be all-singing,
;;; Me> all-dancing, with bells and whistles, flashing lights and a marching
;;; Me> band :-)
;;; 
;;; Me> If you find this useful please mail me so I can feel all warm inside.
;;; Me> Also, please mail bugs, fixes, comments etc.
;;; 
;;; Over lunch I had an idea.  Since you can do:-
;;; 
;;; 	(run-hooks 'this-hook 'that-hook 'the-other-hook)
;;; 
;;; why not allow:-
;;; 
;;; 	(append-hooks 'this-func 'that-fun 'the-other-func)
;;; 
;;; Here's my improved function, now called append-hookS.
;;; 
;;; -- snip -- snip -- snip -- snip -- snip -- snip -- snip -- snip -- snip --

;; this "provide" added by me.
;; nickel@cs.tu-berlin.de, Tue Sep  8 19:44:00 MET DST 1992
;; To prevent collisions with existing versions of app-hook.el I renamed 
;; the file and all functions/variables. Sven Delmas.

(provide 'tk-app-hooks)

(defun tk-append-hooks (hook-symbol &rest hook-functions)
  "Append a number of hook functions to a hook variable.
HOOK-SYMBOL is the name of the hook variable, which does not have to be
bound.  Each &REST HOOK-FUNCTIONS is either the name of the hook function
or is a quoted LAMBDA expression.

e.g.
	(append-hook 'my-hook-symbol
		     'my-hook-function
		     '(lambda ()
			(func1 arg arg)
			(func2 arg arg)))
		     (function (lambda ()
				 (func1 arg arg)
				 (func2 arg arg)))"
  (let ((hook-value (and (boundp hook-symbol) (eval hook-symbol))))
    (cond
     ;; If the hook is unbound or NIL, just set it to the function list.
     ((null hook-value)
      (set hook-symbol hook-functions))

     ;; If the hook is not a list, or *is* a LAMBDA expression, listify the
     ;; hook and append the function list to it.
     ((or (not (listp hook-value))
	  (eq (car hook-value) 'lambda))
      (set hook-symbol (append (list hook-value) hook-functions)))

     ;; The hook is a list and is *not* a LAMBDA expression, so just append the
     ;; hook function list to it.
     (t
      (set hook-symbol (append hook-value hook-functions)))
     )))

;;; -- snip -- snip -- snip -- snip -- snip -- snip -- snip -- snip -- snip --
;;; 
;;; --
;;; Kevin Broadey <kbroadey@edscom.demon.co.uk>
;;; EDS-Scicon, Wavendon Tower, Wavendon, Milton Keynes, MK17 8LX, England.
;;; Phone: +44 908 284198 (direct) or +44 908 585858 ext 4198
;;; These opinions are mine: others available on request.
