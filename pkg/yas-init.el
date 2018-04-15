(require 'yasnippet)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(global-set-key (kbd "M-<tab>") 'yas-expand)
