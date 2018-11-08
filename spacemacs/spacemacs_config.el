;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     osx
     puppet
     vagrant
     php
     gtags
     themes-megapack
     ;;(latex :variables latex-build-command "xelatex")
     javascript
     terraform
     osx
     ruby
     ;;octave
     ;;pdf-tools
     csv
     html
     sql
     yaml
     go
     java
     ;;python
     auto-completion
     git
     github
     markdown
     org
     journal
     (shell :variables
            shell-default-shell 'eshell
            shell-default-position 'bottom)
     ;;spell-checking
     syntax-checking
     ;;version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     geben
     dash-at-point
     re-builder
     interleave
     origami

     ;; org-mode plugins
     org-super-agenda
     org-edna
     org-ehtml
     org-gcal
     magit-todos
     helm-org-rifle

     ;;go-playground
     websocket
     request
     oauth2
     ;;circe
     alert
     emojify
     ;;slack
     ;;all-the-icons
     ;;go-dlv
     ;;vue-mode
     ;;lsp-mode
     ;;lsp-vue

     exec-path-from-shell

     company-lsp
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-tomorrow-eighties
                         material
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Input Mono"
                               :size 12
                               :weight normal
                               :width normal
                               :powerline-scale 0.8)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 100
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 80
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-mode-line-theme 'spacemacs
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; load secrets and credentials from encrypted secrets file
  (require 'epa-file)
  (custom-set-variables '(epg-gpg-program  "/usr/local/bin/gpg"))
  (epa-file-enable)
  ;;(setf epa-pinentry-mode 'loopback)
  (load-library "~/Dropbox/EmacsData/secrets.el.gpg")
  (provide 'secrets)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;;load marmelade repository
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)

  ;;make the frame transparent by default
  (spacemacs/enable-transparency)

  ;;allow for SHIFT+arrow movements between windows
  (windmove-default-keybindings)

  ;;truncate lines by default - this is prettier and more performant
  (setq truncate-lines t)

  ;;scrolling stuff
  (setq mouse-wheel-progressive-speed nil)

  ;; fix font-loading issue that comes up when emacs is run as a daemon
  (add-to-list 'default-frame-alist '(font . "InputMono-12"))

  ;;make projectile cache stuff for faster usage
  (setq projectile-enable-caching t )


  ;; use utf-8 powerline sep since it doesn't have coloration issues
  ;; spaceline-compile is needed to force spacemacs to reload the change
  (setq powerline-default-separator 'utf-8)
  (spaceline-compile)

  ;;highlight all occurances of the symbol at point
  (spacemacs/toggle-automatic-symbol-highlight-on)

  ;; prevent always scrolling to end of shell buffer on new output
  (setq comint-scroll-to-bottom-on-output t)

  ;; make json auto-indent 2 spaces
  (setq-default js2-basic-offset 2
                js-indent-level 2)

  ;; neotree icons
  (setq neo-theme 'icons)

  ;; json formatting
  (add-hook 'json-mode-hook
            (lambda ()
              (make-local-variable 'js-indent-level)
              (setq js-indent-level 2)))

  ;; window splitting thresholds
  (setq split-width-threshold 120)
  (setq split-height-threshold 100)

  ;;********************************************************************************
  ;; shell settings

  ;; make new shells always open in current buffer (so that it behaves like everything else)
  (push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)

  ;; use company mode instead of helm for shell mode auto completions
  (defun my-shell-mode-hook ()
    (company-mode)
    (define-key shell-mode-map (kbd "TAB") #'company-manual-begin))
  (add-hook 'shell-mode-hook #'my-shell-mode-hook)

  ;;********************************************************************************
  ;; Magit settings
  (setq magit-refresh-status-buffer nil) ;; only refresh magit status buffer when it is the active buffer (for better performance)
  (setq vc-handled-backends nil) ;; disable the other emacs "VC" interface to avoid duplicate work

  ;;********************************************************************************
  ;; Python Settings
  ;; fix an error that pops up when launching python interpreter from w/in emacs
  (setq python-shell-completion-native-enable nil)

  (setq python-shell-interpreter "/usr/bin/python3")
  (setq python-shell-interpreter-args "-m IPython --simple-prompt -i")
  (setq flycheck-python-pycompile-executable "python3")

  ;; python-related ignore list for neo-tree
  (setq neo-hidden-regexp-list '("__.*__" ".*\.pyc"))

  ;;********************************************************************************
  ;; Golang settings

  ;;increase "go meta linter" deadline
  (setq flycheck-gometalinter-deadline "3s")
  ;;disable golint since it is noisier than the mess it protects you from :P
  (setq flycheck-gometalinter-disable-linters '("golint"))
  (setq flycheck-gometalinter-fast t)

  (setq go-tab-width 2)

  ;; golang go-dlv.el delve settings
  ;;(add-to-list 'load-path "/usr/local/Cellar/delve/0.12.1")
  ;;(require 'go-dlv)
  ;;(setq gofmt-command "goimports")

  ;;********************************************************************************
  ;; vue.js settings
  ;;(require 'vue-mode)
  ;;(add-to-list 'vue-mode-hook #'smartparens-mode)
  ;;(require 'lsp-mode)
  ;;(require 'lsp-vue)
  ;;(add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
  ;;(with-eval-after-load 'lsp-mode
  ;;  (require 'lsp-flycheck))
  ;;(require 'company-lsp)
  ;;(push 'company-lsp company-backends)

  ;;********************************************************************************
  ;; misc settings and workarounds

  ;; when switching to an emacs window, the following error is displayed:
  ;; "Warning (emacs): recentf mode: Non-character input-event"
  ;; this is apparently due to a lockfile bug - disable lockfiles for now
  (setq create-lockfiles nil)

  ;; always use chrome when browsing a url from emacs
  ;;(setq browse-url-browser-function 'browse-url-chrome)
  (setq browse-url-browser-function 'browse-url-default-browser)

  ;;********************************************************************************
  ;; LaTeX settings

  (setq-default TeX-engine 'xetex)
  (setq-default TeX-PDF-mode t)

  ;;********************************************************************************
  ;; external configuration modules

  ;; load org mode settings
  (load-file "~/.dotfiles/spacemacs/org_config.el")


  ;;********************************************************************************
  ;; more org mode configuration
  ;;(add-to-load-path "/Users/jeffp/personal/org-ql")


  ;;********************************************************************************
  ;; Java layer setup

  (setq eclim-eclipse-dirs '("/Applications/Eclipse.app/Contents/Eclipse")
        eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd"
        eclimd-default-workspace "~/remitly/ClientService"
        eclimd-wait-for-process nil)
  (java :variables java-backend 'eclim)



  ;; make emacs use the same PATH variables as the shell
  (exec-path-from-shell-initialize)


)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#37474f" t)
 '(hl-sexp-background-color "#1c1f26")
 '(org-agenda-files (quote ("/home/jeff/org/calendar/calendar.org")))
 '(org-capture-templates
   (quote
    (("s" "standard" entry
      (file "~/Dropbox/org/inbox/inbox.org")
      "" :prepend t))) t)
 '(package-selected-packages
   (quote
    (nov interleave deft company-auctex auctex-latexmk auctex zenburn-theme zen-and-art-theme white-sand-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme rebecca-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme farmhouse-theme exotica-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme org-super-agenda org-ehtml web-server org-edna org-gcal request-deferred deferred org-caldav phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode helm-go-package go-scratch restclient-helm ob-restclient ob-http go-playground gotest company-restclient know-your-http-well xterm-color winum vue-mode edit-indirect ssass-mode vue-html-mode slack websocket shell-pop reveal-in-osx-finder restclient pbcopy osx-trash osx-dictionary org-category-capture org-mime oauth2 multi-term lsp-vue launchctl fuzzy ghub let-alist goto-chg undo-tree eshell-z eshell-prompt-extras esh-help emojify diminish company-lsp lsp-mode circe all-the-icons memoize spaceline-all-the-icons pandoc-mode ox-pandoc nginx-mode jinja2-mode company-ansible ansible-doc ansible terraform-mode hcl-mode flycheck-gometalinter rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby edit-server-htmlize helm-gtags ggtags gmail-message-mode ham-mode html-to-markdown edit-server go-dlv pdf-tools tablist org magit-gh-pulls go-guru github-search github-clone github-browse-file gist gh marshal logito pcache ht git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter diff-hl flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck auto-dictionary csv-mode lua-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data sql-indent virtualenvwrapper w3 marmalade yaml-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode go-eldoc company-go go-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic uuidgen org-projectile org-download link-hint git-link eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump f column-enforce-mode multi-eshell paradox hydra company-statistics adaptive-wrap ws-butler window-numbering volatile-highlights vi-tilde-fringe toc-org spaceline powerline smooth-scrolling smeargle restart-emacs rainbow-delimiters popwin persp-mode pcre2el spinner page-break-lines orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets open-junk-file neotree move-text mmm-mode markdown-toc s markdown-mode magit-gitflow macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-gitignore request helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md flx-ido flx fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit magit-popup git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-args evil-anzu anzu eval-sexp-fu highlight elisp-slime-nav define-word company-quickhelp pos-tip company clean-aindent-mode buffer-move bracketed-paste auto-yasnippet yasnippet auto-highlight-symbol auto-compile packed dash aggressive-indent ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup quelpa package-build use-package which-key bind-key bind-map evil spacemacs-theme)))
 '(safe-local-variable-values (quote nil))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
