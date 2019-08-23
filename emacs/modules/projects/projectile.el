
(use-package projectile
  :init
  (setq
   projectile-enable-caching 1

   projectile-project-search-path '("~/code/remitly" "~/code/archived/")
   ;projectile-project-root-files-functions '(projectile-root-top-down)
   projectile-globally-ignored-files '("~" ".swp") 

   projectile-completion-system 'ivy

   projectile-switch-project-action 'counsel-projectile-switch-project
   )
  :config
  (projectile-global-mode)
  )


(use-package counsel-projectile
  :after projectile
  :config
  (setq
   counsel-projectile-switch-project-action (lambda (project_root) (find-file (concat project_root "PROJECT_NOTES.org")))
   )

  )


(provide '+projectile)
