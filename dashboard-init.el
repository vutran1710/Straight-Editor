(require 'dashboard)
(require 'page-break-lines)

(global-page-break-lines-mode)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "For the good of Humanity.")
(setq dashboard-startup-banner "~/.emacs.d/banner.png")
(setq dashboard-items '((recents  . 5)
												(projects . 5)))

(add-to-list 'default-frame-alist '(width . 140))
(add-to-list 'default-frame-alist '(height . 40))
