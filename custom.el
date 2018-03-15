(require 'package)
(add-to-list 'package-archives
						 '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

(server-start)
(setq mac-command-modifier 'control)

(load "~/.emacs.d/defaults")
(load "~/.emacs.d/helm-init")
(load "~/.emacs.d/avy-init")
(load "~/.emacs.d/projectile-init")
(load "~/.emacs.d/magit-init")
(load "~/.emacs.d/helm-projectile-init")
(load "~/.emacs.d/expand-region-init")
(load "~/.emacs.d/webmode-init")
(load "~/.emacs.d/ace-window-init")

(load "~/.emacs.d/user-defined")

(load "~/.emacs.d/keybindings")

(provide 'custom)
