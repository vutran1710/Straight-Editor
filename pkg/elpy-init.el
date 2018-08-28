(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"
        python-shell-prompt-detect-failure-warning nil
        elpy-shell-use-project-root nil
        elpy-set-test-runner "py.test")
  (define-key inferior-python-mode-map (kbd "RET") 'electric-newline-and-maybe-indent))
