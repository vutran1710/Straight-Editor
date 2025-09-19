;;; vutr.el -- Module load to support programming -*- lexical-binding: t -*-
;;; Commentary:
;;; Emacs config entry-point
;;; Code:

;; Add paths
(add-to-list 'load-path "~/.emacs.d/lisp")

;; pre-setup
(require 'base-settings)
(require 'global-packages-setup)

;; programming load
;; (require 'vutr-go)
;; (require 'vutr-python)
;; (require 'vutr-web)
(require 'vutr-rust)
(require 'vutr-ai)

;; post-setup
(require 'user-defined)
(require 'keybindings)

;; default theme
(load-theme 'ayu-grey t)

;;; vutr.el ends here
