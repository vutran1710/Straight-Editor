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
(load "~/.emacs.d/helm-init")
(load "~/.emacs.d/avy-init")
(load "~/.emacs.d/ag-init")
(load "~/.emacs.d/projectile-init")
(load "~/.emacs.d/magit-init")
(load "~/.emacs.d/helm-projectile-init")
(load "~/.emacs.d/expand-region-init")
(load "~/.emacs.d/webmode-init")
(load "~/.emacs.d/ace-window-init")
(load "~/.emacs.d/elpy-init")
(load "~/.emacs.d/yaml-mode-init")
(load "~/.emacs.d/restclient-init")

(load "~/.emacs.d/user-defined")

(load "~/.emacs.d/keybindings")

(provide 'custom)
