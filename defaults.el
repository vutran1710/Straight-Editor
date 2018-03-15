(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(fringe-mode '(4 . 0))
(recentf-mode 1)
(electric-pair-mode 1)
(global-linum-mode 1)
(show-paren-mode 1)
(electric-indent-mode 1)


(setq auto-save-default nil)
(setq make-backup-files nil)

(setq-default fringes-outside-margins t)
(setq-default tab-width 2)
(setq-default linum-format " %3d  ")
(setq-default line-spacing 0)

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'whitespace-cleanup)

(setq electric-pair-pairs '(
														(?\' . ?\')
														(?\` . ?\`)
														(?\{ . ?\})
														) )

(set-face-attribute 'default nil :font "Overpass Mono 12")
(set-frame-font "Overpass Mono 12" nil t)
