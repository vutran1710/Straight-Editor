(use-package dockerfile-mode
  :ensure t
  :init (use-package docker-compose-mode
          :ensure t))

(use-package yaml-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-mode)))
