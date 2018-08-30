;; (load "~/.emacs.d/pkg/google-init")
;; (load "~/.emacs.d/pkg/beacon-init")
;; (load "~/.emacs.d/pkg/restart-emacs-init")
;; (load "~/.emacs.d/pkg/magit-init")
;; (load "~/.emacs.d/pkg/modeline-init")
;; (load "~/.emacs.d/pkg/undo-tree-init")
;; (load "~/.emacs.d/pkg/keychord-init")
;; (load "~/.emacs.d/pkg/ace-window-init")
;; (load "~/.emacs.d/pkg/anzu-init")
;; (load "~/.emacs.d/pkg/avy-init")
;; (load "~/.emacs.d/pkg/ag-init")
;; (load "~/.emacs.d/pkg/aggressive-indent-init")
;; (load "~/.emacs.d/pkg/expand-region-init")
;; (load "~/.emacs.d/pkg/smartparens-init")

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

(use-package anzu
  :ensure t
  :hook (after-init . global-anzu-mode)
  :bind (([remap query-replace] . anzu-query-replace)
         ([remap query-replace-regexp] . anzu-query-replace-regexp)
         ("M-r" . anzu-query-replace-at-cursor)))

(use-package avy
  :ensure t
  :bind (("C-." . avy-goto-char)
         ("C-," . avy-goto-char-in-line)
         ("C-\'" . avy-goto-line)))

(use-package ag
  :ensure t
  :if (executable-find "ag")
  :init
  (use-package wgrep-ag :ensure t)
  (setq-default ag-highlight-search t)
  :bind ("M-?" . ag-project))

(use-package aggressive-indent
  :ensure t
  :hook (after-init . global-aggressive-indent-mode))

(use-package expand-region
  :ensure t)

(use-package smartparens-config
  :ensure smartparens
  :config (smartparens-global-mode t))
