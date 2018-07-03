;; Installed most usable themes & fonts
(mapc
 (lambda (package)
   (unless (package-installed-p package)
     (progn (message "installing %s" package)
            (package-refresh-contents)
            (package-install package))))
 '(tango-plus-theme
   darktooth-theme
   gruvbox-theme
   dracula-theme
   faff-theme
   farmhouse-theme
   twilight-theme
   greymatters-theme
   hemisu-theme
   nord-theme
   tao-theme
   subatomic-theme))

(provide 'themes-init)
;;; themes-init.el ends here
