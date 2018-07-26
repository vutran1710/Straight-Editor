(require 'dashboard)
(require 'page-break-lines)

(global-page-break-lines-mode)
(dashboard-setup-startup-hook)
(setq dashboard-banner-logo-title "The true nature of my image you are viewing is simple: above everything, I'm not exactly working right now!")
(setq dashboard-startup-banner "~/.emacs.d/banner.png")
(setq dashboard-items '((recents  . 8)
                        (projects . 9)))
