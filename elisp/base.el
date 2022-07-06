;; === Personal information ===
(setq user-full-name "Javier Schulz"
      user-mail-address "javierschulz@gmail.com")

;; === start the initial frame maximized ===
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; === Do not use `init.el` for `custom-*` code - use `custom-file.el`. ===
(setq custom-file "~/.emacs.d/.custom-file.el")

;; Assuming that the code in custom-file is execute before the code
;; ahead of this line is not a safe assumption. So load this file
;; proactively.
(load-file custom-file)


;; === Packages ===
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
  
;; === Use-packacke ===             
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
  
;; === Windows configuration ===
(tool-bar-mode -1)
(display-time-mode 1)
;; (use-package smart-mode-line)

;; === Keep buffers automatically up to date ===
(global-auto-revert-mode t)

;; === Show matching parentheses ===
(show-paren-mode 1)

;; === Coding System ===
(set-file-name-coding-system 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8) 
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
(setq locale-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(if (boundp 'buffer-file-coding-system)
    (setq-default buffer-file-coding-system 'utf-8)
  (setq default-buffer-file-coding-system 'utf-8))
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; === Highlight current line. ===
(global-hl-line-mode t)

;; === FUENTES: ===
(set-frame-font "DejaVu Sans Mono-12" nil t)
;; (set-frame-font "Fantasque Sans Mono-16" nil t)
;; (set-frame-font "Source Code Pro-14" nil t)
;; (set-frame-font "Monaco-14" nil t)
;; (set-frame-font "Cousine-14" nil t)
(setq default-frame-alist '((font . "DejaVu Sans Mono-12")))

  
;; === Backups y autosalvados se graban en carpeta /home/javier/.emacs.d/auto-save-list/ ===
(setq 
    backup-directory-alist '(("." . "/home/javier/.emacs.d/auto-save-list/"))
    backup-by-copying t
    auto-save-file-name-transforms '((".*" "/home/javier/.emacs.d/auto-save-list/" t))
    kept-new-versions 6
    kept-old-versions 2
    delete-old-versions t
    version-control t)   
  
;; === Transform yes-or-no questions into y-or-n
(defalias 'yes-or-no-p 'y-or-n-p)

;; == iMenu
;; Mostrar el menu con las funciones de los archivos

(use-package imenu
	   :ensure nil
	   :bind (("C-." . imenu)))
	   
;; === Activar chequeo ortográfico ===      
(setq ispell-dictionary "castellano")    ;set the default dictionary
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
  
;; === Activar botón derecho para cambiar palabra sugerida por chequeo ortográfico ===  
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))
     
;; === cambiar idiomas de diccionario ortográfico ===      
(defun fd-switch-dictionary()
      (interactive)
      (let* ((dic ispell-current-dictionary)
    	 (change (if (string= dic "castellano") "english" "castellano")))
        (ispell-change-dictionary change)
        (message "Dictionary switched from %s to %s" dic change)
        ))
      (global-set-key (kbd "<f8>")   'fd-switch-dictionary)

;; === DIRECTORIO POR DEFECTO DE DOCUMENTOS DE EMACS ===      
(setq default-directory "/media/datos/javier/Nextcloud/Notes/org/")
	   
(provide 'base)
