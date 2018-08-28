;;; package -- summary
;;; Commentary:
;;; Code:
(load "~/.emacs.d/mac-modifier")
(load "~/.emacs.d/defaults")
(load "~/.emacs.d/user-defined")

;; Effect-free
(load "~/.emacs.d/pkg/google-init")
(load "~/.emacs.d/pkg/beacon-init")
(load "~/.emacs.d/pkg/themes-init")
(load "~/.emacs.d/pkg/restart-emacs-init")
(load "~/.emacs.d/pkg/magit-init")
(load "~/.emacs.d/pkg/modeline-init")
(load "~/.emacs.d/pkg/undo-tree-init")
(load "~/.emacs.d/pkg/keychord-init")
(load "~/.emacs.d/pkg/ace-window-init")
(load "~/.emacs.d/pkg/anzu-init")
(load "~/.emacs.d/pkg/avy-init")
(load "~/.emacs.d/pkg/ag-init")
(load "~/.emacs.d/pkg/hlinum-init")
(load "~/.emacs.d/pkg/aggressive-indent-init")
(load "~/.emacs.d/pkg/expand-region-init")
(load "~/.emacs.d/pkg/smartparens-init")
;; (load "~/.emacs.d/pkg/rainbow-delimiters-init")
;; (load "~/.emacs.d/pkg/dashboard-init")
;; (load "~/.emacs.d/pkg/treemacs-init")

;; Must-have
(load "~/.emacs.d/pkg/projectile-init")
(load "~/.emacs.d/pkg/counsel-init")
(load "~/.emacs.d/pkg/company-init")
(load "~/.emacs.d/pkg/diff-hl-init")
;; (load "~/.emacs.d/pkg/yaml-mode-init")
;; (load "~/.emacs.d/pkg/flycheck-init")
;; (load "~/.emacs.d/pkg/yas-init")

;; ;; Language IDE
;; (load "~/.emacs.d/pkg/restclient-init")
;; (load "~/.emacs.d/pkg/docker-init")
;; (load "~/.emacs.d/pkg/webmode-init")
;; (load "~/.emacs.d/pkg/org-init")
;; (load "~/.emacs.d/pkg/tide-init")
;; (load "~/.emacs.d/pkg/elpy-init")
;; (load "~/.emacs.d/pkg/cider-init")
;; (load "~/.emacs.d/pkg/alchemist-init")
;; (load "~/.emacs.d/pkg/markdown-init")

;; Keybindings
(load "~/.emacs.d/keybindings")

(provide 'custom)
;;; custom.el ends here
