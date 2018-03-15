(require 'helm)
(require 'helm-ag)
(require 'helm-config)

(global-unset-key "\M-x")
(global-set-key (kbd "M-m") 'helm-M-x)

(provide 'may-helm)
