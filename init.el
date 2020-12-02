;; setup package-repositories: Elpa & Melpa
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

;; Start emacs-server
(defun td/ensure-server-running ()
  (require 'server)
  (unless (server-running-p)
    (server-start)))

(add-hook 'after-init-hook #'td/ensure-server-running)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

;; Move all temp variables & setting to a seprate file
(setq custom-file (expand-file-name ".temp.el" user-emacs-directory))
(load custom-file)

;; Load
(load-file "~/.emacs.d/vutr.el")
