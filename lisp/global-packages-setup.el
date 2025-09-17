;;; global-packages-setup.el --- Essential packages that needs for all setup -*- lexical-binding: t -*-
;;; Commentary:
;;; installing global packages
;;; updated June 23 2021
;;; Code:

;;; Sure run load env-vars first before anything else
(use-package load-env-vars
  :ensure t
  :init
  (let ((base-env (expand-file-name ".env" user-emacs-directory)))
    (when (file-exists-p base-env)
      (load-env-vars base-env))))

(use-package auto-package-update
  :ensure t)

(use-package ace-window
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package aggressive-indent
  :ensure t
  :hook
  ((emacs-lisp-mode . aggressive-indent-mode)
   (web-mode . aggressive-indent-mode)
   (json-mode . aggressive-indent-mode)
   (typescript-mode . aggressive-indent-mode)
   (clojure-mode . aggressive-indent-mode)))

(use-package avy
  :ensure t
  :config (avy-setup-default) (setq avy-background t)
  :custom-face
  (avy-lead-face ((t(:weight bold :foreground "IndianRed1"))))
  (avy-lead-face-0 ((t(:weight bold :foreground "burlywood2")))))

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

(use-package browse-kill-ring
  :ensure t
  :init (browse-kill-ring-default-keybindings))

(use-package cape
  :ensure t
  :init
  ;; Add useful CAPFs; they’ll be tried after LSP
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-symbol)
  ;; Handy commands to invoke explicitly if desired:
  ;; M-x cape-dabbrev, cape-file, cape-keyword, cape-symbol, cape-line, ...
  )

(use-package corfu
  :ensure t
  :init
  (setq corfu-auto t
        corfu-auto-delay 0.05
        corfu-auto-prefix 1
        corfu-preselect 'prompt
        corfu-quit-no-match 'separator   ;; quit if you hit RET with no match
        corfu-on-exact-match nil)
  (global-corfu-mode 1))

;; Optional: docs tooltip for current candidate
(use-package corfu-popupinfo
  :after corfu
  :init (corfu-popupinfo-mode 1))

(use-package consult
  :ensure t)

(use-package ctrlf
  :ensure t
  :init (ctrlf-mode +1))

(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh t))

(use-package kubernetes
  :ensure t)

(use-package k8s-mode
  :ensure t)

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package docker-compose-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package mood-line
  :ensure t
  :init (mood-line-mode))

(use-package dotenv-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode)))

(use-package editorconfig
  :ensure t
  :config (editorconfig-mode 1))

(use-package exec-path-from-shell
  :ensure t
  :init (exec-path-from-shell-initialize))

(use-package expand-region
  :ensure t)

(use-package restart-emacs
  :ensure t)

(use-package fix-word
  :ensure t)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package graphql-mode
  :ensure t)

(use-package marginalia
  :ensure t
  :init (marginalia-mode)
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle)))

(use-package magit
  :ensure t)

(use-package which-key
  :ensure t
  :init (which-key-mode)
  :config
  (setq which-key-idle-delay 1)
  (setq which-key-idle-secondary-delay 0.05))

(use-package undo-tree
  :ensure t
  :config
  (setq undo-tree-auto-save-history nil)
  (global-undo-tree-mode))

(use-package smartparens
  :ensure t
  :config
  (setq sp-show-pair-from-inside t)
  (require 'smartparens-config)
  (smartparens-global-mode +1)
  :diminish smartparens-mode)

(use-package projectile
  :ensure t
  :config (projectile-mode))

(use-package frog-jump-buffer
  :ensure t)

(use-package vertico
  :ensure t
  :init
  (vertico-mode)
  (setq vertico-scroll-margin 0)
  (setq vertico-count 10))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package iedit
  :ensure t
  :diminish iedit-mode)

(use-package wgrep
  :ensure t
  :config
  (setq wgrep-auto-save-buffer t))

(use-package rg
  :ensure t)

(use-package yasnippet
  :ensure t
  :defer 2
  :config (yas-global-mode 1))

(use-package yasnippet-snippets
  :ensure t
  :defer
  :after yasnippet)

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package know-your-http-well
  :ensure t)

(use-package restclient
  :ensure t
  :hook
  (restclient-mode . (lambda ()
                       (setq-local tab-width 4
                                   )))
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(http\\|api\\)\\'" . restclient-mode)))

(use-package quickrun
  :ensure t)

(use-package zop-to-char
  :ensure t)

(use-package eglot
  :ensure t
  :hook ((prog-mode        . eglot-ensure))
  :config
  ;; Silence event spam in *EGLOT events*
  (setq eglot-events-buffer-size 0)
  (setq eglot-inlay-hints-mode 0))

(use-package protobuf-mode
  :ensure t)

(use-package dired-sidebar
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :config
  (setq dired-sidebar-subtree-line-prefix ".."))


;; THEMES SECTION ===================================================================
(use-package ayu-theme
  :ensure t)

(use-package zenburn-theme
  :ensure t)

(use-package tango-plus-theme
  :ensure t)

(use-package solo-jazz-theme
  :ensure t)

(use-package catppuccin-theme
  :ensure t)

(provide 'global-packages-setup)
;;; global-packages-setup.el ends here
