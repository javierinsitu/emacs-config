;; elisp files -  Base configuration 
(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(require 'early-init)    
(require 'base)    
(require 'orgmode)
(require 'theme) ;; Configuracion del tema 
(require 'completion)
(require 'keymappings)
(require 'varios)
(require 'zettelkasten)
(require 'markdown)
(require 'splash)
(require 'hugo)
