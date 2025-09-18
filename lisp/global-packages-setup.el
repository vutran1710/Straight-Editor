;;; global-packages-setup.el --- Essential, documented global packages  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Startup-friendly global package setup with short per-package docs.
;;; - Vertico + Orderless + Consult + Marginalia (minibuffer UX)
;;; - Corfu (+ Cape, popupinfo) for in-buffer completion
;;; - Eglot-first LSP; Flymake UI; Flycheck available but not global
;;; - tree-sitter via treesit-auto
;;; - project.el replaces Projectile; ctrlf removed
;;; Updated: 2025-09-18
;;; Code:

;;;; Load .env early
(use-package load-env-vars
  :ensure t
  :init
  (let ((base-env (expand-file-name ".env" user-emacs-directory)))
    (when (file-exists-p base-env)
      (load-env-vars base-env))))

;;;; Package maintenance
(use-package auto-package-update
  :ensure t
  :commands (auto-package-update-now auto-package-update-maybe)
  :init
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t))

;;;; Window, navigation, selection QoL
(use-package ace-window
  :ensure t
  :commands ace-window
  :bind (("M-o" . ace-window)))

(use-package avy
  :ensure t
  :commands (avy-goto-char avy-goto-char-2 avy-goto-line avy-goto-word-1)
  :init (setq avy-background t)
  :config (avy-setup-default)
  :custom-face
  (avy-lead-face ((t (:weight bold :foreground "IndianRed1"))))
  (avy-lead-face-0 ((t (:weight bold :foreground "burlywood2")))))

(use-package expand-region
  :ensure t
  :commands (er/expand-region er/contract-region)
  :bind (("C-]"   . er/expand-region)
         ("C-M-]" . er/contract-region))
  ;; One-key outward selection growth; complements iedit/avy.
  )

(use-package iedit
  :ensure t
  :commands iedit-mode
  :diminish iedit-mode)

(use-package zop-to-char :ensure t :commands (zop-up-to-char zop-to-char))

;;;; Minibuffer UX: Vertico + Orderless + Consult + Marginalia
(use-package vertico
  :ensure t
  :init
  (setq vertico-scroll-margin 0
        vertico-count 10
        vertico-resize t)
  (vertico-mode 1))

(use-package savehist :init (savehist-mode 1))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package consult
  :ensure t
  :commands (consult-ripgrep consult-line consult-buffer consult-imenu consult-flymake))

(use-package marginalia
  :ensure t
  :init (marginalia-mode 1)
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle)))

;;;; In-buffer completion
(use-package corfu
  :ensure t
  :init
  (setq corfu-auto t
        corfu-auto-delay 0.05
        corfu-auto-prefix 1
        corfu-preselect 'prompt
        corfu-quit-no-match 'separator
        corfu-on-exact-match nil)
  (global-corfu-mode 1))

(use-package corfu-popupinfo
  :after corfu
  :init (corfu-popupinfo-mode 1))

(use-package cape
  :ensure t
  :init
  (add-to-list 'completion-at-point-functions #'cape-file t)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev t)
  (add-to-list 'completion-at-point-functions #'cape-symbol t))

;;;; Editing helpers / visuals
(use-package aggressive-indent
  :ensure t
  :hook ((emacs-lisp-mode . aggressive-indent-mode)
         (web-mode        . aggressive-indent-mode)
         (json-mode       . aggressive-indent-mode)
         (typescript-mode . aggressive-indent-mode)
         (clojure-mode    . aggressive-indent-mode)))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :init (setq sp-show-pair-from-inside t)
  :config
  (require 'smartparens-config)
  (smartparens-global-mode +1))

(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :init (setq undo-tree-auto-save-history nil)
  :config (global-undo-tree-mode 1))

(use-package editorconfig :ensure t :init (editorconfig-mode 1))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :init (which-key-mode 1)
  :config
  (setq which-key-idle-delay 1
        which-key-idle-secondary-delay 0.05))

(use-package beacon :ensure t :init (beacon-mode 1))
(use-package mood-line :ensure t :init (mood-line-mode 1))

;;;; VCS / Projects
(use-package magit :ensure t :commands (magit-status magit-blame))

(use-package diff-hl
  :ensure t
  :hook ((prog-mode . diff-hl-mode)
         (text-mode . diff-hl-mode))
  :config
  (diff-hl-flydiff-mode 1)
  (with-eval-after-load 'magit
    (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh t)))

;; Use built-in project.el instead of Projectile
;; Helpful bindings mirroring common workflows:
;; C-x p f -> project-find-file
;; C-x p p -> project-switch-project
;; C-x p s -> project-search (or consult-ripgrep)
;; C-x p ! -> project-shell
(with-eval-after-load 'project
  (define-key project-prefix-map (kbd "s") #'project-search))

;;;; Shell env (GUI only)
(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;;; Treesitter
(use-package treesit-auto
  :ensure t
  :custom (treesit-auto-install 'prompt)
  :config
  (let ((rust-recipe (make-treesit-auto-recipe
                      :lang 'rust
                      :ts-mode 'rust-ts-mode
                      :url "https://github.com/tree-sitter/tree-sitter-rust"
                      :revision "v0.23.3"
                      :source-dir "src"
                      :ext "\\.rs\\'")))
    (add-to-list 'treesit-auto-recipe-list rust-recipe)
    (add-to-list 'treesit-auto-langs 'rust))
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode 1))

;;;; LSP: Eglot-first (Flymake UI). Flycheck optional.
(use-package eglot
  :ensure t
  :hook ((prog-mode . eglot-ensure))
  :init
  (setq eglot-events-buffer-size 0
        eglot-inlay-hints-mode 0))

(use-package flycheck
  :ensure t
  :commands (flycheck-mode flycheck-list-errors))

;;;; HTTP / proto / markdown / snippets
(use-package graphql-mode :ensure t :mode "\\.graphqls?\\'")
(use-package know-your-http-well :ensure t)

(use-package restclient
  :ensure t
  :mode ("\\.\\(http\\|api\\)\\'" . restclient-mode)
  :hook (restclient-mode . (lambda () (setq-local tab-width 4))))

(use-package protobuf-mode :ensure t :mode "\\.proto\\'")

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'"       . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;;;; Search & wgrep
(use-package rg :ensure t :commands (rg rg-project))
(use-package wgrep
  :ensure t
  :commands wgrep-change-to-wgrep-mode
  :init (setq wgrep-auto-save-buffer t))

;;;; Kill ring & misc utilities
(use-package browse-kill-ring
  :ensure t
  :commands browse-kill-ring
  :init (browse-kill-ring-default-keybindings))

(use-package quickrun :ensure t :commands quickrun)
(use-package fix-word :ensure t :commands (fix-word-upcase fix-word-downcase fix-word-capitalize))

;;;; Docker/K8s
(use-package docker
  :ensure t
  :commands docker
  :bind (("C-c d" . docker)))

(use-package dockerfile-mode :ensure t :mode "Dockerfile\\'")
(use-package docker-compose-mode :ensure t :mode "docker-compose\\.*\\.yml\\'")
(use-package kubernetes :ensure t :commands kubernetes-overview)
(use-package k8s-mode :ensure t :mode "\\.\\(k8s\\|ya?ml\\)\\'")

;;;; Env files
(use-package dotenv-mode
  :ensure t
  :mode "\\.env\\..*\\'")

;;;; Sidebar
(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config (setq dired-sidebar-subtree-line-prefix ".."))

;;;; Icons & Themes
(use-package all-the-icons :ensure t :commands (all-the-icons-install-fonts))
(use-package ayu-theme         :ensure t)
(use-package zenburn-theme     :ensure t)
(use-package tango-plus-theme  :ensure t)
(use-package solo-jazz-theme   :ensure t)
(use-package catppuccin-theme  :ensure t :init (setq catppuccin-flavor 'latte))

(provide 'global-packages-setup)
;;; global-packages-setup.el ends here
