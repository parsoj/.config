;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Jeff Parsons"
      user-mail-address "parsoj@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Iosevka" :size 16)
      ;;doom-variable-pitch-font (font-spec :family "ETBembo" :size 16)
      )
(setq doom-big-font-increment 6)


(setq doom-themes-treemacs-enable-variable-pitch nil)
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)
(setq doom-themes-treemacs-theme 'doom-colors)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type 'absolute)
(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



;; you know how to delete windows vs buffers - don't let doom override the ability
;; to delete a buffer if you need to
(advice-remove #'kill-current-buffer #'doom--switch-to-fallback-buffer-maybe-a)




(setq ivy-re-builders-alist
      '((t . ivy--regex-ignore-order)))

(setq ivy-posframe-height-alist '(
                                  (+ivy-read-string     . 1)
                                  ))

(setq ivy-posframe-parameters
      '((left-fringe . 5)
        (right-fringe . 5)))


;; don't obnoxiously expand the minibuffer all the time
;; (setq resize-mini-windows nil)


;; graphql mode
(use-package! graphql-mode)

(use-package! osascripts)

(setq third-party-dir (expand-file-name (concat doom-private-dir "third-party")))
(setq extras-dir (expand-file-name (concat doom-private-dir "extras")))



;; word-wrap mode by default for shell mode
;; (add-hook! 'shell-mode-hook #'+word-wrap-mode)

;; python settings
(after!
  (set-repl-handler! 'python-mode #'+python/open-ipython-repl))

;; org-capture frames need the display frame param to avoid the
;; "unknown terminal type" error when running from an emacsclient executing
;; against a headless server/daemon
(setq +org-capture-frame-parameters
  `((name . "doom-capture")
    (width . 70)
    (height . 25)
    (transient . t)
    ;; (display . ":0")
    (display . ,(getenv "DISPLAY"))
    ,(if IS-MAC '(menu-bar-lines . 1))))

;;  org-super-agenda tries to force its own keybinds on you
;;  prevent this from happening
(setq org-super-agenda-header-map (make-sparse-keymap))

(set-popup-rule! "^\\*helpful" :side 'top :size 0.40)


(map! :leader "SPC" #'counsel-M-x)

(require 'dash)
(-map (lambda (x) (load! x)) (directory-files-recursively extras-dir ".*\\.el$"))
