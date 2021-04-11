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
  (setenv "WORKON_HOME" "/Users/vumacbook/.local/share/virtualenvs/"))

(use-package py-autopep8
  :ensure t
  :hook ((python-mode . py-autopep8-enable-on-save)))

(use-package blacken
  :ensure t
  :hook ((python-mode . blacken-mode)))

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook ((python-mode . (lambda ()
			  (require 'lsp-python-ms)
			  (lsp-deferred))))
  :config
  (setq pyvenv-post-activate-hooks
	(lambda()
	  (message "activated...")
	  (setq lsp-python-ms-extra-paths
		(vector
		 (concat pyvenv-virtual-env "lib/python3.7/site-packages/")
		 (concat pyvenv-virtual-env "lib/python3.8/site-packages/")
		 (concat pyvenv-virtual-env "lib/python3.9/site-packages/"))))))


(provide 'vutr-python)
;;; vutr-python ends here
