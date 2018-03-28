(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(server-start)
(setq mac-command-modifier 'control)

(load "~/.emacs.d/defaults")
(load "~/.emacs.d/user-defined")
(load "~/.emacs.d/keybindings")

;; Auto-complete or Company?
;;(load "~/.emacs.d/pkg/auto-complete-init")
(load "~/.emacs.d/pkg/company-init")

;; Must-have
(load "~/.emacs.d/pkg/avy-init")
(load "~/.emacs.d/pkg/ag-init")
(load "~/.emacs.d/pkg/know-http-init")
(load "~/.emacs.d/pkg/projectile-init")
(load "~/.emacs.d/pkg/magit-init")
(load "~/.emacs.d/pkg/expand-region-init")
(load "~/.emacs.d/pkg/webmode-init")
(load "~/.emacs.d/pkg/cider-init")
(load "~/.emacs.d/pkg/ace-window-init")
(load "~/.emacs.d/pkg/elpy-init")
(load "~/.emacs.d/pkg/yaml-mode-init")
(load "~/.emacs.d/pkg/restclient-init")
(load "~/.emacs.d/pkg/diff-hl-init")
(load "~/.emacs.d/pkg/dashboard-init")
(load "~/.emacs.d/pkg/yas-init")
(load "~/.emacs.d/pkg/aggressive-indent-init")
(load "~/.emacs.d/pkg/multi-cursor-init")
(load "~/.emacs.d/pkg/undo-tree-init")
(load "~/.emacs.d/pkg/keychord-init")
(load "~/.emacs.d/pkg/themes-init")


;; Ivy or helm?
;;; Ivy
(load "~/.emacs.d/pkg/counsel-init")

;;; Helm
;; (load "~/.emacs.d/pkg/helm-init")
;; (load "~/.emacs.d/pkg/helm-projectile-init")

(provide 'custom)
