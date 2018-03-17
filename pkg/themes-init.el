;; Installed most usable themes & fonts
(mapc
 (lambda (package)
   (unless (package-installed-p package)
     (progn (message "installing %s" package)
            (package-refresh-contents)
            (package-install package))))
 '(doom-themes tango-plus-theme))
