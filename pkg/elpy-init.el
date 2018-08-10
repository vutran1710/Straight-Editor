(use-package elpy
  :ensure t
  :config
  (elpy-enable)
  (add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt"
        elpy-shell-use-project-root nil
        elpy-set-test-runner "pytest"
        elpy-test-pytest-runner-command '("pytest" "-s" "--service=talentmind" "--env=local")))
