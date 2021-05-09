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

(use-package swiper
  :ensure t)

(use-package beacon
  :ensure t
  :init (beacon-mode 1))

(use-package magit
  :ensure t)

(use-package docker
  :ensure t)

(use-package docker-compose-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package dotenv-mode
  :ensure t
  :config (add-to-list 'auto-mode-alist '("\\.env\\..*\\'" . dotenv-mode)))

(use-package which-key
  :ensure t
  :init
  (which-key-mode))

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
  (setq sp-show-pair-from-inside t)
  (require 'smartparens-config)
  (smartparens-global-mode +1)
  (smartparens-global-strict-mode +1)
  :diminish smartparens-mode)

(use-package browse-kill-ring
  :ensure t
  :init (browse-kill-ring-default-keybindings))

(use-package expand-region
  :ensure t)

(use-package fix-word
  :ensure t)

(use-package aggressive-indent
  :ensure t
  :config (global-aggressive-indent-mode 1))

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

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package doom-themes
  :ensure t)

(use-package iedit
  :ensure t
  :diminish iedit-mode)

(use-package ag
  :ensure t
  :if (executable-find "ag")
  :init (use-package wgrep-ag :ensure t)
  :config
  (setq-default ag-highlight-search t)
  (setq wgrep-auto-save-buffer t))

(use-package company
  :ensure t
  :defer t
  :init (global-company-mode)
  :diminish company-mode
  :config
  (setq-default company-idle-delay .1
		company-dabbrev-other-buffers 'all
		company-dabbrev-code-other-buffers 'all
		company-dabbrev-code-everywhere t
		company-minimum-prefix-length 1
		company-show-numbers t
		company-tooltip-limit 7
		company-tooltip-align-annotations t
		company-require-match nil
		company-echo-delay 0.1
		company-dabbrev-downcase nil)

  (setq company-frontends
	'(company-pseudo-tooltip-frontend
	  company-echo-metadata-frontend))

  (setq company-backends
	'((company-capf
	   company-dabbrev
	   company-dabbrev-code
	   company-files))))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package know-your-http-well
  :ensure t)

(use-package company-restclient
  :ensure t)

(use-package restclient
  :ensure t
  :hook
  (restclient-mode . (lambda ()
		       (set (make-local-variable 'company-backends)
			    '(company-restclient company-yasnippet company-capf))))
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(http\\|api\\)\\'" . restclient-mode)))

(use-package json-navigator
  :ensure t)

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(provide 'global-packages-setup)
;;; global-packages-setup ends here
