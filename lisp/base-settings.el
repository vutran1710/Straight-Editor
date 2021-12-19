;;; package --- Summary
;;; Commentary:
;;; basic settings for Emacs June 17 2021
;;; Code:

;; Custom keys with osx
(setq mac-option-modifier 'meta)
(setq mac-control-modifier 'control)
(setq mac-command-modifier 'meta)

;; Look & feels
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(fringe-mode '(5 . 0))
(global-display-line-numbers-mode t)
(setq inhibit-startup-screen t)

;; Font & faces
(set-face-attribute 'default nil :font "Menlo 13")
(setq-default line-spacing 6)

;; Opening-window-size
(when (window-system)
  (set-frame-size (selected-frame) 130 60)
  (set-frame-position (selected-frame) 50 30))

;; Calibrate emacs default settings
(setq default-directory "/Users/vutran/Works/")
(setq-default auto-save-default nil
              indent-tabs-mode nil
              make-backup-files nil
              recentf-max-menu-items 15
              recentf-max-saved-items 15
              tramp-default-method "ssh"
              visible-bell nil
              ring-bell-function 'ignore
              js-indent-level 2)

;; Misc
(fset 'yes-or-no-p 'y-or-n-p)
(add-hook 'before-save-hook 'whitespace-cleanup)
(show-paren-mode 1)
(delete-selection-mode t)
(recentf-mode 1)
(setq-default require-final-newline t)
(require 'mood-line)
(mood-line-mode)
(mouse-wheel-mode -1)


(provide 'base-settings)
;;; base-settings ends here
