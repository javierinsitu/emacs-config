;; Configuracion de easy-hugo
(use-package easy-hugo
    :ensure t
    :config
    (setq easy-hugo-basedir "/media/datos/javier/Nextcloud/Blog/milanga-blog/")
    (setq easy-hugo-url "https://milangaelectronica.com.ar")
    (setq easy-hugo-sshdomain "milangaelectronica.com.ar")
    (setq easy-hugo-root "/media/datos/javier/Nextcloud/Blog/milanga-blog/")
    (setq easy-hugo-postdir "content/posts")
    (setq easy-hugo-previewtime "300")
    (define-key global-map (kbd "C-c C-e") 'easy-hugo)
    (setq easy-hugo-server-flags "-D"))

(provide 'hugo)
