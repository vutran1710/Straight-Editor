(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(defun td/ensure-server-running ()
  (require 'server)
  (unless (server-running-p)
    (server-start)))

(add-hook 'after-init-hook #'td/ensure-server-running)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(load-file "~/.emacs.d/custom.el")

(setq custom-file (expand-file-name ".temp.el" user-emacs-directory))
(load custom-file)

(condition-case nil
    (mac-auto-operator-composition-mode)
  (error "unable to enable font-ligature"))
