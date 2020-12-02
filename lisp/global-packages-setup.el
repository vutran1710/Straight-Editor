;;; package --- Summary: installing global packages
;;; Commentary: updated Dec 3 2020
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
  (setq smartparens-global-strict-mode t)
  (require 'smartparens-config)
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
  :config (projectile-mode)
  :bind
  ("C-c m" . projectile-vc)
  ("C-c p p" . projectile-switch-project)
  ("C-;" . projectile-find-file))

(use-package frog-jump-buffer
  :ensure t
  :bind ("C-t" . frog-jump-buffer))

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

(provide 'global-packages-setup)
;;; global-packages-setup ends here
