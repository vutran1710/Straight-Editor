(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

(fringe-mode '(4 . 0))
(recentf-mode 1)
(electric-pair-mode 1)
(show-paren-mode 1)
(electric-indent-mode 1)
(delete-selection-mode 1)

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq-default line-spacing 0)
(setq-default fringes-outside-margins t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq-default linum-format "%3d  ")
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
