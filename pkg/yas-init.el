(use-package yasnippet
  :ensure t
  :hook
  (prog-mode-hook . yas-minor-mode)
  (restclient-mode-hook . yas-minor-mode)
  :bind ("M-<tab>" . yas-expand)
  :config (yas-reload-all))
