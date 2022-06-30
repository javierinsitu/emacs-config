;; === Zetteldeft ===
(use-package zetteldeft
  :ensure t
  :after deft
  :config (zetteldeft-set-classic-keybindings))
  

;; === Deft ===
(use-package deft 
  :init
  (setq deft-directory "/media/datos/javier/Nextcloud/Notes//Notes/zettelkasten")
  (setq deft-extensions '("md" "org"))
  (setq deft-use-filename-as-title t)
  (setq deft-use-filter-string-for-filename t)
  (setq deft-recursive t)
    :bind 
  ("<f5>" . deft)
  :ensure t)
(setq-default truncate-lines 1) ;; Hace que Deft ponga archivos y descripcion en una linea

(provide 'zettelkasten)
