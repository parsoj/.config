(use-package company

  :init
  (setq company-idle-delay .1) 
  )

(with-eval-after-load '+keybinds
  (general-define-key
   :keymaps 'company-active-map
   "TAB" 'company-complete-selection
   "<tab>" 'company-complete-selection
   )
) 

(use-package company-quickhelp
  :after company
  :config
  (company-quickhelp-mode))