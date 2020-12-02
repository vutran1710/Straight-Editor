(use-package restart-emacs
  :ensure t)

(use-package docker-tramp
  :ensure t)

(use-package dotenv-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode)))

;; (use-package kubernetes
;;   :ensure t
;;   :commands (kubernetes-overview))

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

(use-package magit
  :ensure t)

(use-package avy
  :ensure t
  :config (avy-setup-default) (setq avy-background t)
  :custom-face
  (avy-lead-face ((t(:weight bold))))
  (avy-lead-face-0 ((t(:weight bold)))))

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-mode)
  :config (setq doom-modeline-height 20))

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))

(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.1
        key-chord-one-key-delay 0.2))

(use-package ace-window
  :ensure t
  :bind ("M-[" . ace-window))

(use-package anzu
  :ensure t
  :config (global-anzu-mode +1))

(use-package ag
  :ensure t
  :if (executable-find "ag")
  :init (use-package wgrep-ag :ensure t)
  :config
  (setq-default ag-highlight-search t)
  (setq wgrep-auto-save-buffer t))

(use-package smartparens-config
  :ensure smartparens
  :config (smartparens-global-mode 1))

(use-package browse-kill-ring
  :ensure t
  :init (browse-kill-ring-default-keybindings))

(use-package expand-region
  :ensure t)

(use-package fix-word
  :ensure t)

(use-package crux
  :ensure t)

(use-package editorconfig
  :ensure t
  :commands editorconfig-mode
  :delight editorconfig-mode
  :init (add-hook 'prog-mode-hook #'editorconfig-mode)
  :config
  (progn
    (add-to-list 'editorconfig-indentation-alist
                 '(swift-mode swift-indent-offset))))

(use-package all-the-icons)

(use-package hlinum
  :ensure t
  :init
  (hlinum-activate))

(use-package projectile
  :ensure t
  :config (projectile-mode)
  :init
  (load "~/.emacs.d/common/todo")
  (require 'doom-todo-ivy)
  :bind ("C-c m" . projectile-vc))

(use-package frog-jump-buffer
  :ensure t)

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh t))

(use-package restclient
  :ensure t
  :init
  (use-package know-your-http-well :ensure t)
  (use-package company-restclient :ensure t)
  :hook (restclient-mode . linum-mode)
  :config
  (add-to-list 'company-backends 'company-restclient)
  (add-to-list 'auto-mode-alist '("\\.\\(http\\|api\\|rest\\)\\'" . restclient-mode)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package haml-mode
  ;Required for sass-mode"
  :ensure t)

(provide 'utils)
;;; utils ends here
