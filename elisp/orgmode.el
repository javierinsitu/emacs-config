;; === org-mode agenda options ===

(custom-set-variables
 '(org-agenda-files
   '("/media/datos/javier/Nextcloud/Notes/org/Notas Medicas.org" "/media/datos/javier/Nextcloud/Notes/org/inbox.org"))
 '(org-deadline-warning-days 7)
 '(org-directory "/media/datos/javier/Nextcloud/Notes/org/")
 '(org-clock-persist t)
 '(org-agenda-breadcrumbs-separator " ❱ "))


;; Compact the block agenda view
(setq org-agenda-compact-blocks t)

(setq org-default-notes-file "/media/datos/javier/Nextcloud/Notes/org/inbox.org")
 

(setq org-priority-faces '((?A . error)
					      (?B . warning)
				          (?C . success)))
(setq org-ellipsis (if (char-displayable-p ?) " " nil))
	   

(setq org-log-done t)



;; === Configuracion de Org-refile (C-c C-w) ===
(setq org-refile-use-outline-path 'file)
(setq org-outline-path-complete-in-steps nil)
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

;; === Org-Alert ===

;; === COLORES DE ESTADOS ===
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))

              
;; === Toc-org ===
;; Mantendrá una tabla de contenido en el primer encabezado que tiene una etiqueta :TOC:.

(use-package toc-org
       :ensure t
	   :after org
	   :hook (org-mode . toc-org-enable))
 
;; === ORG-indent ===
;; Aspecto mejorado al indentar
;; Modo mas limpio de org

	   
;; === Configuracion para archivar notas en archivo dedicado a esto, por orden cronologico: ===
(setq org-archive-location "/media/datos/javier/Nextcloud/Notes/org/%s_archivo.org::datetree/")

;; === Justifica el texto para que las lineas largas no se corten. Sino que vayan bajando a la siguiente linea. ===
(global-visual-line-mode t)

;; === ORG-CAPTURE ===
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "/media/datos/javier/Nextcloud/Notes/org/inbox.org")

;; === Capture templates ===
(setq org-capture-templates
              '(("t" "Nuevo TODO" entry
               (file+headline "/media/datos/javier/Nextcloud/Notes/org/inbox.org" "TAREAS")
               "* TODO %?" :prepend t :empty-lines 1)
               ("i" "Ideas y notas" entry
               (file+headline "/media/datos/javier/Nextcloud/Notes/org/tech.org" "Ideas")
               "** %?" :prepend t :empty-lines 1)
               ("n" "Nota médica" entry
               (file "/media/datos/javier/Nextcloud/Notes/org/Notas Medicas.org")
               "* %?\n:PROPERTIES:\n:CUSTOM_ID: %<%Y%m%d%H%M%S - >\n:CREATED: %u\n:END:\n" :prepend nil :time-prompt t :empty-lines 1)
               ("a" "Audio Podcast" entry
               (file+olp "/media/datos/javier/Nextcloud/Notes/org/milangaelectronica.com.ar.org" "Homepage" "Audios")
               "** TODO %? %[~/.emacs.d/org-capture-template-milanga-podcast.txt]" :empty-lines 1 :prepend t)
               ("p" "Post milanga" entry
               (file+olp "/media/datos/javier/Nextcloud/Notes/org/milangaelectronica.com.ar.org" "Homepage" "Blog")
               "** TODO %? %[~/.emacs.d/org-capture-template-milanga-blog.txt]" :empty-lines 1 :prepend t)
               ("j" "Journal entry" entry
               (file+headline "/media/datos/javier/Nextcloud/Notes/org/tech.org" "Journal")
               "** %u %?" :prepend t :empty-lines 1 :time-prompt t :tree-type week)
               ("z" "Zettel" entry
               (file+headline "/media/datos/javier/Nextcloud/Notes/org/zettelkasten.org" "Zettels")
               "* %? %[~/.emacs.d/zettels.txt]" :empty-lines 1 :prepend t)))
            
;; === Nice bullet points. Retires org-bullets ===
;; Prettify UI
(use-package org-superstar :after org :hook (org-mode . org-superstar-mode))

;; === ORG-Super-Agenda ===
(use-package org-super-agenda
  :ensure t
  :config (org-super-agenda-mode)
)

(setq org-agenda-custom-commands
  '(("c" "Super Agenda" agenda
     (org-super-agenda-mode)
     ((org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "Programado para este dia"
				:time-grid t
				:scheduled today
                :order 0)
         (:name "Important"
                ;; Single arguments given alone
                :tag "turnos"
                :priority "A"
                :order 1)
         (:name "Due soon"
				:deadline future)
         (:name "Reschedule"
                :scheduled past)
         (:name "Overdue"
                :deadline past)

         ;; Groups supply their own section names when none are given
         (:todo "WAITING" :order 8)  ; Set order of this section
         (:todo ("SOMEDAY" "HOLD" "CHECK" "NEXT" "WATCHING")
                ;; Show this group at the end of the agenda (since it has the
                ;; highest number). If you specified this group last, items
                ;; with these todo keywords that e.g. have priority A would be
                ;; displayed in that group instead, because items are grouped
                ;; out in the order the groups are listed.
                :order 9)
         (:priority<= "B"
                      ;; Show this section after "Today" and "Important", because
                      ;; their order is unspecified, defaulting to 0. Sections
                      ;; are displayed lowest-number-first.
                      :order 2)
         ;; After the last group, the agenda will display items that didn't
         ;; match any of these groups, with the default order position of 99
         )))
         
  '("t" "Todo View"
    (
     (todo "" ((org-agenda-overriding-header "")
               (org-super-agenda-groups
                '((:name "Inbox"
                         :file-path "inbox"
                         :order 0
                         )
                  (:auto-category t
                                  :order 9)
         (org-agenda nil "a"))))))))))
         
         
;; === CALENDARIO calfw ===         
(use-package calfw
    :ensure t
    :config
    (setq cfw:org-overwrite-default-keybinding t)
    (setq calendar-week-start-day 1)
    (setq calendar-month-name-array
        ["Enero" "Febrero" "Marzo" "Abril" "Mayo" "Junio" "Julio" "Agosto" "Septiembre" "Octubre" "Noviembre" "Diciembre"])
    (setq calendar-day-name-array
        ["Domingo" "Lunes" "Martes" "Miércoles" "Jueves" "Viernes" "Sábado"])
    :bind ("C-c f" . cfw:open-org-calendar))

(use-package calfw-org
    :ensure t)

(provide 'orgmode)
