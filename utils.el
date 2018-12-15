(use-package restart-emacs
  :ensure t)

(use-package google-this
  :ensure t
  :config (google-this-mode 1))

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

(use-package magit
  :ensure t)

(use-package doom-modeline
  :ensure t
  :defer t
  :hook (after-init . doom-modeline-init)
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

(use-package aggressive-indent
  :ensure t
  :hook (after-init . global-aggressive-indent-mode))

(use-package expand-region
  :ensure t)

(use-package smartparens-config
  :ensure smartparens
  :config (smartparens-global-mode 1))

(use-package dashboard
  :ensure t
  :init (use-package page-break-lines :ensure t)
  :config
  (global-page-break-lines-mode)
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 4)
                          (projects . 4)))
  (setq dashboard-banner-logo-title "SORCERER")
  (setq dashboard-startup-banner "~/.emacs.d/graphics/sorceress.png"))


(use-package editorconfig
  :ensure t
  :commands editorconfig-mode
  :delight editorconfig-mode
  :init (add-hook 'prog-mode-hook #'editorconfig-mode)
  :config
  (progn
    (add-to-list 'editorconfig-indentation-alist
                 '(swift-mode swift-indent-offset))))
