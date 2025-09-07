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
;; (require 'vutr-org)
;; (require 'vutr-python)
;; (require 'vutr-rust)
;; (require 'vutr-web)

;; post-setup
(require 'user-defined)
(require 'keybindings)
;;; vutr.el ends here
