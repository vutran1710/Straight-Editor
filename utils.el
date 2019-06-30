(use-package restart-emacs
  :ensure t)

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

(use-package magit
  :ensure t)

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-mode)
  :config (setq doom-modeline-height 21))

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

(use-package iedit
  :ensure t
  :bind ("M-r" . iedit-mode)
  :config
  (set-face-foreground 'iedit-occurrence "white")
  (set-face-background 'iedit-occurrence "orange red")
  (define-key iedit-mode-keymap (kbd "M-n") 'iedit-expand-down-to-occurrence)
  (define-key iedit-mode-keymap (kbd "M-p") 'iedit-expand-up-to-occurrence))

(use-package avy
  :ensure t)

(use-package ag
  :ensure t
  :if (executable-find "ag")
  :init (use-package wgrep-ag :ensure t)
  :config
  (setq-default ag-highlight-search t)
  (setq wgrep-auto-save-buffer t))

(use-package ibuffer-vc
  :ensure t
  :config
  (add-hook 'ibuffer-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic)))))

(use-package npm-mode
  :ensure t
  :config (npm-global-mode))

;; (use-package aggressive-indent
;;   :ensure t
;;   :hook (after-init . global-aggressive-indent-mode))

(use-package smartparens-config
  :ensure smartparens
  :config (smartparens-global-mode 1))

(use-package browse-kill-ring
  :ensure t
  :init (browse-kill-ring-default-keybindings))

(use-package easy-kill
  :ensure t
  :init (global-set-key [remap kill-ring-save] 'easy-kill))

(use-package ace-jump-buffer
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

(use-package dashboard
  :ensure t
  :config
  (global-page-break-lines-mode)
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda . 5)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t)
  (setq dashboard-banner-logo-title "me@vutr.io")
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-startup-banner "~/.emacs.d/graphics/sorceress.png"))

(use-package hlinum
  :ensure t
  :init
  (hlinum-activate))

(use-package dumb-jump
  :ensure t
  :bind (("C-c j o" . dumb-jump-go-other-window)
         ("C-c j j" . dumb-jump-go)
         ("C-c j i" . dumb-jump-go-prompt))
  :config (setq dumb-jump-selector 'ivy))

(use-package projectile
  :ensure t
  :config (projectile-global-mode)
  :bind ("C-c m" . projectile-vc))

(use-package
  frog-jump-buffer
  :ensure t
  :bind ("C-x b" . frog-jump-buffer)
  :config
  (dolist (regexp '("TAGS" "^\\*Compile-log" "-debug\\*$" "^\\:" "errors\\*$" "^\\*Backtrace" "-ls\\*$"
                    "stderr\\*$" "^\\*Flymake" "^\\*vc" "^\\*Warnings" "^\\*eldoc" "\\^*Shell Command"))
    (push regexp frog-jump-buffer-ignore-buffers)))

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

(load "~/.emacs.d/common/todo")
(require 'doom-todo-ivy)
