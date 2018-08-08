(use-package yasnippet
  :ensure t
  :bind ("M-<tab>" . yas-expand)
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'restclient-mode-hook 'yas-minor-mode))
