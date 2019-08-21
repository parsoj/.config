
(use-package projectile
  :init
  (load (concat config-root "local-settings/projects.el"))
  (setq
   projectile-globally-ignored-files '("~" ".swp") 
   projectile-project-root-files-functions '(projectile-root-top-down)
   projectile-enable-caching 1
   )
  :config
  (projectile-discover-projects-in-search-path)
  (projectile-global-mode)
  )
