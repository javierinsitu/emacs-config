;; === ATAJOS DE TECLADO ==

(global-set-key (kbd "<f12>") 'org-agenda-list)
(global-set-key (kbd "<f2>") 'treemacs)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; asigna "C-c o" para abrir mi inbox.org sin tener que buscarlo
(global-set-key (kbd "C-c i")
                (lambda () (interactive) (find-file "/media/datos/javier/Nextcloud/Notes/inbox.org")))

;; asigna "C-c n" para abrir mi Notas médicas sin tener que buscarlo
(global-set-key (kbd "C-c n")
                (lambda () (interactive) (find-file "/media/datos/javier/Nextcloud/Notes/Notas Medicas.org")))

;; F2           treemacs
;; F5           Deft
;; F8           cambia idioma del corrector
;; F12          Agenda

;; C-x tt       treemacs
;; C-c ac       Super-agenda
;; C-x C-n      Dired sidebar

;; make some use of the Super key
(define-key global-map [?\s-a] 'dired-sidebar-toggle-sidebar)
(define-key global-map [?\s-c] 'cfw:open-org-calendar)

(provide 'keymappings)
