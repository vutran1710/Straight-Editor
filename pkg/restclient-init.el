(require 'restclient)

(add-hook 'restclient-mode-hook 'linum-mode)

(add-to-list 'auto-mode-alist '("\\.api\\'" . restclient-mode))
(add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))
(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))
