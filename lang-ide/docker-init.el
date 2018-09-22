(use-package docker
  :ensure t
  :bind ("C-c d" . docker)
  :defer t)

(use-package dockerfile-mode
  :ensure t
  :init (use-package docker-compose-mode :ensure t))
