;;; package -- summary
;;; Commentary:
;;; Code:
(load "~/.emacs.d/mac-modifier")
(load "~/.emacs.d/defaults")
(load "~/.emacs.d/user-defined")

;; Must-have
(load "~/.emacs.d/pkg/company-init")
(load "~/.emacs.d/pkg/anzu-init")
(load "~/.emacs.d/pkg/avy-init")
(load "~/.emacs.d/pkg/ag-init")
(load "~/.emacs.d/pkg/smartparens-init")
(load "~/.emacs.d/pkg/projectile-init")
(load "~/.emacs.d/pkg/magit-init")
(load "~/.emacs.d/pkg/webmode-init")
(load "~/.emacs.d/pkg/ace-window-init")
(load "~/.emacs.d/pkg/yaml-mode-init")
(load "~/.emacs.d/pkg/restclient-init")
(load "~/.emacs.d/pkg/diff-hl-init")
(load "~/.emacs.d/pkg/flycheck-init")
(load "~/.emacs.d/pkg/yas-init")
(load "~/.emacs.d/pkg/aggressive-indent-init")
(load "~/.emacs.d/pkg/modeline-init")
(load "~/.emacs.d/pkg/undo-tree-init")
(load "~/.emacs.d/pkg/keychord-init")
(load "~/.emacs.d/pkg/themes-init")

;; Language IDE
(load "~/.emacs.d/pkg/org-init")
(load "~/.emacs.d/pkg/javascript-init.el")
(load "~/.emacs.d/pkg/tide-init")
(load "~/.emacs.d/pkg/elpy-init")
(load "~/.emacs.d/pkg/cider-init")
(load "~/.emacs.d/pkg/alchemist-init")
(load "~/.emacs.d/pkg/markdown-init")

;; Ivy
(load "~/.emacs.d/pkg/counsel-init")

;; Keybindings
(load "~/.emacs.d/keybindings")

;; Eye-candy
;; (load "~/.emacs.d/pkg/treemacs-init")
;; (load "~/.emacs.d/pkg/editorconfig-init")
;; (load "~/.emacs.d/pkg/dashboard-init")
;; (load "~/.emacs.d/pkg/hlinum-init")
;; (load "~/.emacs.d/pkg/rainbow-delimiters-init")

(provide 'custom)
;;; custom.el ends here
