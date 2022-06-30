;; === Theme ===
;(use-package doom-themes
;  :config
  ;; Global settings (defaults)
;  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;        doom-themes-enable-italic t) ; if nil, italics is universally disabled
;  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
;  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
;  (doom-themes-neotree-config)
  ;; or for treemacs users
;  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
;  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
;  (doom-themes-org-config))
  
(use-package dracula-theme 
  :init
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'dracula t)
  :ensure t) 

;; === ARREGLOS VISUALES ===

;; === Mostrar emojis === 
(use-package emojify
  :ensure t
  :hook (after-init . global-emojify-mode))
  
;; == Iconos ===
;; Primero: M-x all-the-icons-install-fonts
(use-package all-the-icons)


;; === Pretty-mode ===
;; Cambiar ciertos caracteres por unos visualmente atractivos
(use-package pretty-mode
	   :ensure t
	   :config (global-pretty-mode t))

(use-package smart-mode-line-powerline-theme :ensure t)	   
(use-package smart-mode-line
  :ensure t
  :init (add-hook 'after-init-hook 'sml/setup)
  :config

  (sml/apply-theme 'powerline))



(provide 'theme)
