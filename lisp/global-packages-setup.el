;;; package --- Summary:
;;; Commentary:
;;; installing global packages
;;; updated Dec 3 2020
;;; Code:

(use-package exec-path-from-shell
  :ensure t
  :init
  (exec-path-from-shell-initialize))

(use-package restart-emacs
  :ensure t)

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

(use-package magit
  :ensure t)

(use-package avy
  :ensure t
  :config (avy-setup-default) (setq avy-background t)
  :custom-face
  (avy-lead-face ((t(:weight bold :foreground "IndianRed1"))))
  (avy-lead-face-0 ((t(:weight bold :foreground "burlywood2")))))

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))

(use-package smartparens
  :ensure t
  :config
  (setq sp-show-pair-from-inside nil)
  (require 'smartparens-config)
  (smartparens-global-mode t)
  (smartparens-strict-mode t)
  :diminish smartparens-mode)

(use-package browse-kill-ring
  :ensure t
  :init (browse-kill-ring-default-keybindings))

(use-package expand-region
  :ensure t)

(use-package fix-word
  :ensure t)

(use-package projectile
  :ensure t
  :config (projectile-mode))

(use-package frog-jump-buffer
  :ensure t)

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh t))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package selectrum
  :ensure t
  :init (selectrum-mode +1))

(use-package selectrum-prescient
  :ensure t
  :init
  (selectrum-prescient-mode +1)
  (prescient-persist-mode +1))

(use-package smart-mode-line
  :ensure t
  :config (sml/setup)
  (setq sml/theme 'respectful))

(provide 'global-packages-setup)
;;; global-packages-setup ends here
