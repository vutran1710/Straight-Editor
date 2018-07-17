;;; package -- summary

;;; Commentary:

;;; Code:
(server-start)

(load "~/.emacs.d/mac-modifier")
(load "~/.emacs.d/keybindings")
(load "~/.emacs.d/defaults")
(load "~/.emacs.d/user-defined")

;; Auto-complete or Company?
;; (load "~/.emacs.d/pkg/auto-complete-init")
(load "~/.emacs.d/pkg/company-init")

;; Must-have
(load "~/.emacs.d/pkg/avy-init")
(load "~/.emacs.d/pkg/ag-init")
(load "~/.emacs.d/pkg/know-http-init")
(load "~/.emacs.d/pkg/smartparens-init")
(load "~/.emacs.d/pkg/projectile-init")
(load "~/.emacs.d/pkg/magit-init")
(load "~/.emacs.d/pkg/webmode-init")
(load "~/.emacs.d/pkg/cider-init")
(load "~/.emacs.d/pkg/ace-window-init")
(load "~/.emacs.d/pkg/elpy-init")
(load "~/.emacs.d/pkg/yaml-mode-init")
(load "~/.emacs.d/pkg/restclient-init")
(load "~/.emacs.d/pkg/diff-hl-init")
(load "~/.emacs.d/pkg/hlinum-init")
(load "~/.emacs.d/pkg/flycheck-init")
(load "~/.emacs.d/pkg/tide-init")
;; (load "~/.emacs.d/pkg/dashboard-init")
(load "~/.emacs.d/pkg/yas-init")
(load "~/.emacs.d/pkg/aggressive-indent-init")
(load "~/.emacs.d/pkg/telephone-init")
(load "~/.emacs.d/pkg/multi-cursor-init")
(load "~/.emacs.d/pkg/rainbow-delimiters-init")
(load "~/.emacs.d/pkg/undo-tree-init")
(load "~/.emacs.d/pkg/keychord-init")
(load "~/.emacs.d/pkg/themes-init")
(load "~/.emacs.d/pkg/javascript-init.el")

;; Ivy or helm?
;;; Ivy
(load "~/.emacs.d/pkg/counsel-init")

;;; Helm
;; (load "~/.emacs.d/pkg/helm-init")
;; (load "~/.emacs.d/pkg/helm-projectile-init")

(provide 'custom)
;;; custom.el ends here
