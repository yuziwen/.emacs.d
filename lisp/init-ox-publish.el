;; publish my personal blog

(require 'ox-publish)

(setq org-publish-project-alist
      '(("blog-notes"
         :base-directory "~/yuziwen.github.io/org"
         :base-extension "org"
         :publishing-directory "~/yuziwen.github.io/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 2
         :auto-preamble t
         :section-numbers nil
         ;; :author "Yourname"
         ;; :email "example@test.com"
         :auto-sitemap t       ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"
         :sitemap-title "Sitemap"
         :sitemap-sort-files anti-chronologically
         :sitemap-file-entry-format "%d %t"
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"/css/worg.css\"/>")
        ("blog-static"
         :base-directory "~/yuziwen.github.io/org"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/yuziwen.github.io/public_html"
         :recursive t
         :publishing-function org-publish-attachment)
        ("blog" :components ("blog-notes" "blog-static"))))