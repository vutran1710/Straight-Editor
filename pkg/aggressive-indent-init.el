(use-package aggressive-indent
  :ensure t
  :hook (after-init . global-aggressive-indent-mode)
  :config (add-hook 'scala-mode-hook (lambda () (aggressive-indent-mode -1))))
