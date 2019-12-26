(use-package py-autopep8
  :ensure t)

(use-package yapfify
  :ensure t
  :config
  (add-hook 'python-mode-hook 'yapf-mode))

(use-package elpy
  :ensure t
  :init (setenv "WORKON_HOME" "/Users/vumacbook/.local/share/virtualenvs/")
  :config
  (elpy-enable)
  (setq elpy-rpc-virtualenv-path 'current)
  (add-hook 'elpy-mode-hook
            (lambda ()
              (highlight-indentation-mode -1)))
  (setq python-shell-interpreter "python"
        python-shell-interpreter-args "-i")
  (add-hook 'inferior-python-mode-hook
            (lambda () (setq-local tab-width '4))))

(use-package poetry
  :ensure t
  :config
  (poetry-tracking-mode))
