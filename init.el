;;; init.el --- Emacs configuration entry point -*- lexical-binding: t; -*-

;;; Commentary:
;; Main Emacs configuration file that sets up package management,
;; starts the Emacs server, and loads the main configuration.

;;; Code:

;; Setup package repositories: ELPA & MELPA
(require 'package)

(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(package-initialize)

;; Start emacs-server
(defun vutr--ensure-server-running ()
  "Ensure Emacs server is running, start it if not."
  (require 'server)
  (unless (server-running-p)
    (server-start)))

(add-hook 'after-init-hook #'vutr--ensure-server-running)

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq-default custom-safe-themes t)

;; Move all temp variables & settings to a separate file
(setq custom-file (expand-file-name ".temp.el" user-emacs-directory))
(load custom-file)

;; Load main configuration
(load-file "~/.emacs.d/vutr.el")
(put 'set-goal-column 'disabled nil)

(provide 'init)
;;; init.el ends here
