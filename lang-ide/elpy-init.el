(use-package pipenv
  :hook (python-mode . pipenv-mode)
  :init
  (setq
   pipenv-projectile-after-switch-function
   #'pipenv-projectile-after-switch-extended))

(use-package py-autopep8
  :ensure t)

(use-package elpy
  :ensure t
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
