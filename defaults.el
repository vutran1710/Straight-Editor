;;; package -- summary
;;; Commentary:
;; Some default settings for EMACS

;;; Code:
(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(setq mac-option-modifier 'meta)
(setq mac-control-modifier 'control)
;; (setq mac-command-modifier 'control)
;; (setq ns-function-modifier 'hyper)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(show-paren-mode t)
(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)
(electric-indent-mode t)
(recentf-mode 1)
(fringe-mode '(5 . 0))

(setq-default recentf-mode t
              blink-cursor-mode nil
              custom-safe-themes t
              auto-save-default nil
              make-backup-files nil
              fringes-outside-margins t
              tab-width 2
              indent-tabs-mode nil
              tab-always-indent t
              recentf-max-menu-items 25
              tramp-default-method "ssh"
              linum-format "%3d  "
              visible-bell nil
              ring-bell-function 'ignore
              mac-use-title-bar t)

(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'visual-line-mode)
(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'text-mode-hook '(lambda()
                             (turn-on-auto-fill)
                             (set-fill-column 120)))

(when (window-system)
  (set-frame-size (selected-frame) 150 80)
  (set-frame-position (selected-frame) 50 30))

(add-hook 'before-save-hook 'whitespace-cleanup)

(set-face-attribute 'default nil :font "Fira Code Medium 12")
(set-frame-font "Fira Code Medium 12" nil t)
(setq-default line-spacing 2)

(setq custom-theme-directory "~/.emacs.d/themes")

(provide 'default)
;;; defaults.el ends here
