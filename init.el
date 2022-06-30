;; elisp files -  Base configuration 
(add-to-list 'load-path (concat user-emacs-directory "elisp"))
(require 'early-init)    
(require 'base)    
(require 'splash)
(require 'theme) ;; Configuracion del tema 
(require 'completion)
(require 'keymappings)
(require 'orgmode)
(require 'varios)
(require 'zettelkasten)
(require 'markdown)
(require 'hugo)
