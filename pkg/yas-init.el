(require 'yasnippet)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'restclient-mode-hook #'yas-minor-mode)

(global-set-key (kbd "M-<tab>") 'yas-expand)
