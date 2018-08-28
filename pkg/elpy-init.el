(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (add-hook 'elpy-mode-hook
            (lambda () (highlight-indentation-mode -1)))
  (setq python-shell-interpreter "python"
        python-shell-interpreter-args "-i")
  (add-hook 'inferior-python-mode-hook
            (lambda () (setq-local tab-width '4))))
