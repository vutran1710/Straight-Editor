;;; package -- summary
;;; Commentary:
;; Some default settings for EMACS

;;; Code:
(require 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(mac-auto-operator-composition-mode)
(fringe-mode '(4 . 0))
(recentf-mode 1)
(show-paren-mode 1)
(electric-indent-mode 1)
(delete-selection-mode 1)
(blink-cursor-mode -1)

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)

(setq custom-safe-themes t)
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq-default fringes-outside-margins t)
(set-default 'truncate-lines t)
;;(setq-default visual-line-mode t)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq tramp-default-method "ssh")
(setq-default linum-format "%3d  ")
(setq-default line-spacing 2)
(when (window-system)
  (set-frame-size (selected-frame) 150 70)
  (set-frame-position (selected-frame) 50 30))
(setq-default mac-use-title-bar t)

(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'before-save-hook 'whitespace-cleanup)
(set-face-attribute 'default nil :font "Fira Code 12")
(set-frame-font "Fira Code 12" nil t)
(setq custom-theme-directory "~/.emacs.d/themes")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(provide 'default)
;;; defaults.el ends here
