;;; package -- Summary
;;; Commentary:
;;; Emacs config entry-point
;;; Code:

;; Add paths
(add-to-list 'load-path "~/.emacs.d/lisp")

;; pre-setup
(require 'base-settings)
(require 'global-packages-setup)

;; programming load
(require 'vutr-org)
(require 'vutr-web)
(require 'vutr-python)
(require 'vutr-clojure)
(require 'vutr-sol)
(require 'vutr-rust)
(require 'vutr-go)
(require 'vutr-graphql)

;; post-setup
(require 'user-defined)
(require 'keybindings)
(require 'custom-settings)
;;; vutr.el ends here
