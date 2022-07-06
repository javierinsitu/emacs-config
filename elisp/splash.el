;; === DASHBOARD ===

;; Dependencies 
(use-package page-break-lines
  :ensure t) 
(use-package all-the-icons)

(use-package dashboard 
  :init
  (add-hook 'after-init-hook 'dashboard-refresh-buffer)
  :ensure t
  :config
  (dashboard-setup-startup-hook) 
  (add-to-list 'dashboard-items '(agenda) t)
  (setq dashboard-week-agenda t) 
  (setq dashboard-set-heading-icons t) 
  (setq dashboard-set-file-icons t) 
  (setq dashboard-startup-banner 3) 
  (setq dashboard-set-init-info t) 
  (setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                     ;;   (projects . 5)
                        (agenda . 5)
                        (registers . 5))))

(provide 'splash) 
