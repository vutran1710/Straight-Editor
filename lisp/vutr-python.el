;;; package --- Summary:
;;; Commentary:
;;; python setup
;;; Code:

(use-package py-autopep8
  :ensure t)

(use-package python-black
  :ensure t
  :demand t
  :after python)

(use-package elpy
  :ensure t
  :init
  (setenv "WORKON_HOME" "/Users/vumacbook/.local/share/virtualenvs/")
  (elpy-enable)
  :config
  (setq elpy-rpc-virtualenv-path 'current)
  (setq python-shell-interpreter "python" python-shell-interpreter-args "-i")
  (add-to-list 'auto-mode-alist '("\\Pipfile\\'" . conf-unix-mode))
  :hook
  ((elpy-mode . (lambda ()
	      (highlight-indentation-mode -1)
	      (elpy-company-backend t)
	      (python-black-on-save-mode t)))
   before-save-hook 'elpy-format-code nil t))

(use-package poetry
  :ensure t
  :config
  (poetry-tracking-mode))

(provide 'vutr-python)
;;; python ends here
