;;; package --- Summary:
;;; Commentary:
;;; python setup
;;; Code:

(use-package poetry
  :ensure t
  :config
  (poetry-tracking-mode nil))

(use-package pyvenv
  :ensure t
  :diminish
  :config
  (pyvenv-mode +1)
  (pyvenv-tracking-mode +1)
  (setenv "WORKON_HOME" "/Users/vumacbook/.local/share/virtualenvs/"))

(use-package blacken
  :ensure t
  :hook ((python-mode . blacken-mode)))

(use-package lsp-python-ms
  :ensure t
  :init
  (setq lsp-python-ms-auto-install-server t)
  (add-to-list 'auto-mode-alist '("\\Pipfile\\'" . conf-unix-mode))
  (setq pyvenv-post-activate-hooks
	(lambda()
	  (message "activated...")
	  (setq lsp-python-ms-extra-paths
		(vector
		 (projectile-project-root)
		 (concat pyvenv-virtual-env "lib/python3.7/site-packages/")
		 (concat pyvenv-virtual-env "lib/python3.8/site-packages/")
		 (concat pyvenv-virtual-env "lib/python3.9/site-packages/")))
	  (flycheck-add-next-checker 'lsp 'python-flake8)
	  (flycheck-add-next-checker 'python-flake8 'python-mypy)))
  :hook
  (python-mode . (lambda ()
		   (require 'lsp-python-ms)
		   (lsp-deferred))))


(provide 'vutr-python)
;;; vutr-python ends here
