(use-package docker
  :ensure t
  :defer t)

(use-package dockerfile-mode
  :ensure t
  :init (use-package docker-compose-mode :ensure t))
