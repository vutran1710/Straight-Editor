;;; init.el --- Emacs configuration entry point -*- lexical-binding: t; -*-

;;; Commentary:
;; Main Emacs configuration file that sets up package management,
;; starts the Emacs server, and loads the main configuration.

;;; Code:

;; Disable package.el in favour of straight.el
(setq package-enable-at-startup nil)

;; Bootstrap straight.el
(defvar bootstrap-version)
(let* ((straight-base (expand-file-name "straight/repos/straight.el"
                                        user-emacs-directory))
       (bootstrap-file (expand-file-name "bootstrap.el" straight-base))
       (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Straight + use-package integration
(setq straight-use-package-by-default t)
(straight-use-package 'use-package)
(require 'use-package)
(setq-default custom-safe-themes t)

;; Start emacs-server
(defun vutr--ensure-server-running ()
  "Ensure Emacs server is running, start it if not."
  (require 'server)
  (unless (server-running-p)
    (server-start)))

(add-hook 'after-init-hook #'vutr--ensure-server-running)

;; Move all temp variables & settings to a separate file
(setq custom-file (expand-file-name ".temp.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))

;; Load main configuration
(load-file "~/.emacs.d/vutr.el")
(put 'set-goal-column 'disabled nil)

(provide 'init)
;;; init.el ends here
