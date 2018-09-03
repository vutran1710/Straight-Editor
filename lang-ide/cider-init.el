(use-package cider
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'yas-reload-all)
  (add-hook 'clojure-mode-hook 'yas-minor-mode)
  (add-hook 'cider-repl-mode-hook 'linum-mode)
  (setq cider-repl-pop-to-buffer-on-connect nil))
