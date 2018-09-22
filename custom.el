;;; package -- summary
;;; Commentary:
;;; Code:
(load "~/.emacs.d/defaults")
(load "~/.emacs.d/user-defined")

;; Effect-free
(load "~/.emacs.d/utils")
(load "~/.emacs.d/themes-init")
;; (load "~/.emacs.d/hlinum-init")
;; (load "~/.emacs.d/rainbow-delimiters-init")
;; (load "~/.emacs.d/treemacs-init")

;; Must-have
(load "~/.emacs.d/common/projectile-init")
(load "~/.emacs.d/common/counsel-init")
(load "~/.emacs.d/common/company-init")
(load "~/.emacs.d/common/yas-init")
(load "~/.emacs.d/common/diff-hl-init")
(load "~/.emacs.d/common/restclient-init")
(load "~/.emacs.d/common/org-init")
(load "~/.emacs.d/common/flycheck-init")

;; ;; Language IDE
(load "~/.emacs.d/lang-ide/yaml-mode-init")
(load "~/.emacs.d/lang-ide/elpy-init")
(load "~/.emacs.d/lang-ide/webmode-init")
(load "~/.emacs.d/lang-ide/tide-init")
(load "~/.emacs.d/lang-ide/alchemist-init")
(load "~/.emacs.d/lang-ide/cider-init")
(load "~/.emacs.d/lang-ide/markdown-init")
(load "~/.emacs.d/lang-ide/docker-init")

;; Keybindings
(load "~/.emacs.d/keybindings")

(provide 'custom)
;;; custom.el ends here
