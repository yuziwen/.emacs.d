;;; publish my personal blog

(require 'ox-publish)

(setq org-publish-project-alist
      '(("blog-notes"
         :base-directory "~/blog/org"
         :base-extension "org"
         :publishing-directory "~/blog/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :html-link-home "index.html"
         :html-link-org-files-as-html org-html-link-org-files-as-html
         :headline-levels 4
         :with-author nil
         :with-email nil
         :with-creator nil
         :with-timestamps nil
         :html-postamble nil
         :auto-preamble t
         :section-numbers nil
         :auto-preamble t
         :section-numbers nil
         :auto-sitemap t       ; Generate sitemap.org automagically...
         :sitemap-filename "sitemap.org"
         :sitemap-title "Sitemap"
         :sitemap-sort-files anti-chronologically
         :sitemap-file-entry-format "%d %t"
         :html-head-include-default-style nil
         :html-head-include-scripts nil
         :html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"css/worg.css\"/>")
        ("blog-static"
         :base-directory "~/blog/org"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "~/blog"
         :recursive t
         :publishing-function org-publish-attachment)
        ("blog" :components ("blog-notes" "blog-static"))))


;; change export color in src block
(defun my-html-filter-src-color (src-block backend info)
  (when (org-export-derived-backend-p backend 'html)
    (let ((result src-block))
      (setq result (replace-regexp-in-string "#00ffff" "#262680" result)) ;; keywords
      (setq result (replace-regexp-in-string "#7fffd4" "#228b22" result)) ;; self-eval
      (setq result (replace-regexp-in-string "#b0c4de" "#262680" result)) ;; primitives
      (setq result (replace-regexp-in-string "#87cefa\\|#eedd82\\|#98fb98" "black" result)) ;; functions and variables and types
      result)))

(add-to-list 'org-export-filter-src-block-functions
             'my-html-filter-src-color)

(provide 'init-ox-publish)