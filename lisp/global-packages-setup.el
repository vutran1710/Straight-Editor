;;; global-packages-setup.el --- Essential, documented global packages  -*- lexical-binding: t; -*-

;;; Commentary:
;; Startup-friendly global package setup with short per-package docs.
;; - Vertico + Orderless + Consult + Marginalia (minibuffer UX)
;; - Corfu (+ Cape, popupinfo) for in-buffer completion
;; - Eglot-first LSP; Flymake UI; Flycheck available but not global
;; - tree-sitter via treesit-auto
;; - project.el replaces Projectile; ctrlf removed
;; Updated: 2025-09-18

;;; Code:

;;;;; Environment and Package Management

;; Load .env early for environment configuration
(use-package load-env-vars
  :ensure t
  :defer nil
  :init
  (let ((base-env (expand-file-name ".env" user-emacs-directory)))
    (when (file-exists-p base-env)
      (load-env-vars base-env))))

;; Automatic package updates
(use-package auto-package-update
  :ensure t
  :defer t
  :commands (auto-package-update-now auto-package-update-maybe)
  :custom
  (auto-package-update-delete-old-versions t)
  (auto-package-update-hide-results t))

;;;;; Window Management and Navigation

;; Better isearch
(use-package ctrlf
  :ensure t
  :init
  (ctrlf-mode 1))

;; Quick window switching
(use-package ace-window
  :ensure t
  :defer t)

;; Jump to characters/lines/words
(use-package avy
  :ensure t
  :defer t
  :commands (avy-goto-char avy-goto-char-2 avy-goto-line avy-goto-word-1)
  :custom
  (avy-background t)
  :custom-face
  (avy-lead-face ((t (:weight bold :foreground "IndianRed1"))))
  (avy-lead-face-0 ((t (:weight bold :foreground "burlywood2"))))
  :config
  (avy-setup-default))

;; Smart region expansion
(use-package expand-region
  :ensure t
  :defer t
  :commands (er/expand-region er/contract-region))

;; Multiple cursor editing
(use-package iedit
  :ensure t
  :defer t
  :diminish iedit-mode
  :commands iedit-mode)

;; Enhanced zap-to-char
(use-package zop-to-char
  :ensure t
  :defer t
  :commands (zop-up-to-char zop-to-char))

;;;;; Minibuffer and Completion Framework

;; Save minibuffer history
(use-package savehist
  :ensure nil
  :defer nil
  :init
  (savehist-mode 1))

;; Vertical minibuffer completion
(use-package vertico
  :ensure t
  :defer nil
  :custom
  (vertico-scroll-margin 0)
  (vertico-count 10)
  (vertico-resize t)
  :init
  (vertico-mode 1))

;; Flexible completion matching
(use-package orderless
  :ensure t
  :defer nil
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Enhanced search and navigation commands
(use-package consult
  :ensure t
  :defer t
  :commands (consult-ripgrep consult-line consult-buffer consult-imenu consult-flymake))

;; Rich annotations in minibuffer
(use-package marginalia
  :ensure t
  :defer nil
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode 1))

;;;;; In-Buffer Completion

;; Modern completion-at-point UI
(use-package corfu
  :ensure t
  :defer nil
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.05)
  (corfu-auto-prefix 1)
  (corfu-preselect 'prompt)
  (corfu-quit-no-match 'separator)
  (corfu-on-exact-match nil)
  :init
  (corfu-popupinfo-mode 1)
  :hook ((prog-mode . corfu-mode)
         (shell-mode . corfu-mode)
         (eshell-mode . corfu-mode)))

;; Completion backends
(use-package cape
  :ensure t
  :defer nil
  :init
  (add-to-list 'completion-at-point-functions #'cape-file t)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev t)
  (add-to-list 'completion-at-point-functions #'cape-symbol t))

;;;;; Editing Enhancement

;; Automatic indentation
(use-package aggressive-indent
  :ensure t
  :defer t
  :hook ((emacs-lisp-mode . aggressive-indent-mode)
         (web-mode        . aggressive-indent-mode)
         (json-mode       . aggressive-indent-mode)
         (typescript-mode . aggressive-indent-mode)
         (clojure-mode    . aggressive-indent-mode)))

;; Smart parentheses handling
(use-package smartparens
  :ensure t
  :defer nil
  :diminish smartparens-mode
  :custom
  (sp-show-pair-from-inside t)
  :config
  (require 'smartparens-config)
  (smartparens-global-mode 1))

;; Visual undo system
(use-package undo-tree
  :ensure t
  :defer nil
  :diminish undo-tree-mode
  :custom
  (undo-tree-auto-save-history nil)
  :config
  (global-undo-tree-mode 1))

;; EditorConfig support
(use-package editorconfig
  :ensure t
  :defer nil
  :init
  (editorconfig-mode 1))

;; Keybinding help
(use-package which-key
  :ensure t
  :defer nil
  :diminish which-key-mode
  :custom
  (which-key-idle-delay 1)
  (which-key-idle-secondary-delay 0.05)
  :init
  (which-key-mode 1))

;; Cursor highlighting
(use-package beacon
  :ensure t
  :defer nil
  :init
  (beacon-mode 1))

;; Minimal mode line
(use-package lambda-line
  :straight (:type git :host github :repo "lambda-emacs/lambda-line")
  :custom
  (lambda-line-icon-time t) ;; requires ClockFace font (see below)
  (lambda-line-clockface-update-fontset "ClockFaceRect") ;; set clock icon
  (lambda-line-abbrev t) ;; abbreviate major modes
  (lambda-line-hspace "  ")  ;; add some cushion
  (lambda-line-prefix t) ;; use a prefix symbol
  (lambda-line-prefix-padding nil) ;; no extra space for prefix
  (lambda-line-status-invert nil)  ;; no invert colors
  (lambda-line-gui-ro-symbol  " ⨂") ;; symbols
  (lambda-line-gui-mod-symbol " ⬤")
  (lambda-line-gui-rw-symbol  " ◯")
  (lambda-line-space-top +.50)  ;; padding on top and bottom of line
  (lambda-line-space-bottom -.50)
  (lambda-line-symbol-position 0.1) ;; adjust the vertical placement of symbol
  :config
  (lambda-line-mode))

;;;;; Version Control and Projects

;; Git interface
(use-package magit
  :ensure t
  :defer t
  :commands (magit-status magit-blame))

;; VCS diff highlighting
(use-package diff-hl
  :ensure t
  :defer t
  :hook ((prog-mode . diff-hl-mode)
         (text-mode . diff-hl-mode))
  :config
  (diff-hl-flydiff-mode 1)
  (with-eval-after-load 'magit
    (add-hook 'magit-post-refresh-hook #'diff-hl-magit-post-refresh t)))

;;;;; System Integration

;; Shell environment sync (GUI only)
(use-package exec-path-from-shell
  :ensure t
  :defer nil
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

;;;;; Language Support

;; Tree-sitter integration
(use-package treesit-auto
  :ensure t
  :defer nil
  :custom
  (treesit-auto-install 'prompt)
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

;; Syntax checking (on-demand)
(use-package flycheck
  :ensure t
  :defer t
  :commands (flycheck-mode flycheck-list-errors))

;;;;; Web and API Development

;; GraphQL support
(use-package graphql-mode
  :ensure t
  :defer t
  :mode "\\.graphqls?\\'")

;; HTTP reference
(use-package know-your-http-well
  :ensure t
  :defer t)

;; REST client
(use-package restclient
  :ensure t
  :defer t
  :mode ("\\.\\(http\\|api\\)\\'" . restclient-mode)
  :hook (restclient-mode . (lambda () (setq-local tab-width 4))))

;; Protocol Buffers
(use-package protobuf-mode
  :ensure t
  :defer t
  :mode "\\.proto\\'")

;; Markdown editing
(use-package markdown-mode
  :ensure t
  :defer t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'"       . markdown-mode))
  :custom
  (markdown-command "multimarkdown"))

;;;;; Search and Replace

;; Ripgrep integration
(use-package rg
  :ensure t
  :defer t
  :commands (rg rg-project))

;; Editable grep results
(use-package wgrep
  :ensure t
  :defer t
  :commands wgrep-change-to-wgrep-mode
  :custom
  (wgrep-auto-save-buffer t))

;;;;; Utilities

;; Kill ring browser
(use-package browse-kill-ring
  :ensure t
  :defer t
  :commands browse-kill-ring
  :init
  (browse-kill-ring-default-keybindings))

;; Quick code execution
(use-package quickrun
  :ensure t
  :defer t
  :commands quickrun)

;; Word case fixing
(use-package fix-word
  :ensure t
  :defer t
  :commands (fix-word-upcase fix-word-downcase fix-word-capitalize))

;;;;; DevOps and Infrastructure

;; Docker interface
(use-package docker
  :ensure t
  :defer t
  :commands docker)

;; Dockerfile editing
(use-package dockerfile-mode
  :ensure t
  :defer t
  :mode "Dockerfile\\'")

;; Docker Compose support
(use-package docker-compose-mode
  :ensure t
  :defer t
  :mode "docker-compose\\.*\\.yml\\'")

;; Environment files
(use-package dotenv-mode
  :ensure t
  :defer t
  :mode "\\.env\\..*\\'")

;;;;; UI Enhancement

;; File browser sidebar
(use-package dired-sidebar
  :ensure t
  :defer t
  :commands dired-sidebar-toggle-sidebar
  :custom
  (dired-sidebar-subtree-line-prefix ".."))

;;;;; Icons and Themes

;; Icon fonts
(use-package all-the-icons
  :ensure t
  :defer t
  :commands all-the-icons-install-fonts)

;; Color themes
(use-package ayu-theme
  :ensure t
  :defer t)

(use-package zenburn-theme
  :ensure t
  :defer t)

(use-package tango-plus-theme
  :ensure t
  :defer t)

(use-package solo-jazz-theme
  :ensure t
  :defer t)

(provide 'global-packages-setup)
;;; global-packages-setup.el ends here
