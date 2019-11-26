(use-package eldoc
  :straight (eldoc :type built-in)
  :init
  ;;(setq eldoc-documentation-function (lambda () (documentation (symbol-at-point))))
  ;;(global-eldoc-mode -1)

  :config

  (defvar +eldoc-posframe-buffer "*eldoc-posframe*"
    "The posframe buffer name use by eldoc-posframe.")

  (defun +eldoc-posframe-cleanup ()
    (posframe-hide +eldoc-posframe-buffer) 

    )

  (defun +posframe-poshandler-top-right-offset (info &optional font-height)
    (let* ((window-left (+ -20 (plist-get info :parent-window-left)))
	   (window-top (+ 20 (plist-get info :parent-window-top)))
	   (window-width (plist-get info :parent-window-width)) 
	   (posframe-width  (plist-get info :posframe-width)))
      (cons (+ window-left window-width (- 0 posframe-width))
	    window-top))) 

  (defun +eldoc-posframe-message-function (format-string &rest args)
    "Display FORMAT-STRING and ARGS, using posframe.el library."
    (when format-string
      (posframe-show
       +eldoc-posframe-buffer
       :string (apply 'format format-string args)
       ;;       :background-color (face-background 'eldoc-posframe-background-face nil t)
       :internal-border-width 1
       :internal-border-color "grey"
       :left-fringe 10
       :width 60

       :poshandler 
       #'+posframe-poshandler-top-right-offset


       )))
  ;; TODO separate the poshandler into a dedicated defun - make it max /3 window and positioned correctly
  ;; TODO eldoc debounce, or use deferred
  ;; TODO eldoc show current value for variables
  ;; ** look up existing eldoc function

  (setq eldoc-message-function #'+eldoc-posframe-message-function)  

  )

