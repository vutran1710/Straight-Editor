(use-package py-autopep8
  :ensure t)

(use-package python-black
  :ensure t
  :demand t
  :after python)

(use-package elpy
  :ensure t
  :init (setenv "WORKON_HOME" "/Users/vumacbook/.local/share/virtualenvs/")(elpy-enable)
  :config
  (setq elpy-rpc-virtualenv-path 'current)
  (add-hook 'elpy-mode-hook
            (lambda ()
              (highlight-indentation-mode -1)
              (elpy-company-backend t)
              (python-black-on-save-mode t)
              (add-hook 'before-save-hook
                                      'elpy-format-code nil t)))

  (setq python-shell-interpreter "python"
        python-shell-interpreter-args "-i")
  (add-hook 'inferior-python-mode-hook
            (lambda () (setq-local tab-width '4))))

(use-package poetry
  :ensure t
  :config
  (poetry-tracking-mode))
