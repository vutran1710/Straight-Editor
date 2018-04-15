(require 'smartparens)
(require 'smartparens-config)

(add-hook 'prog-mode-hook #'smartparens-mode)

(global-set-key (kbd "C-c C-y") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-c C-u") 'sp-end-of-sexp)
