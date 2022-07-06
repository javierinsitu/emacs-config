;; === Completado automatico ==

(use-package ivy
  :diminish (ivy-mode . "")
  :init (ivy-mode 1) ; globally at startup
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-height 20)
  (setq ivy-count-format "%d/%d ")
  (provide 'init-ivy)
  :ensure t)

;; === Hacer más usable ivy ===
;; FLX ordena los resultados de M-x de acorde al último usado.


  
(provide 'completion)
