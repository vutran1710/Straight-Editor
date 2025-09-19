;; setup package-repositories: Elpa & Melpa
(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

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
(setq-default custom-safe-themes t)

;; Move all temp variables & setting to a seprate file
(setq custom-file (expand-file-name ".temp.el" user-emacs-directory))
(load custom-file)

;; Load
(load-file "~/.emacs.d/vutr.el")
(put 'set-goal-column 'disabled nil)
