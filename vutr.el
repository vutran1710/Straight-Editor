;;; package -- Summary
;;; Commentary:
;;; Emacs config entry-point
;;; Code:

;; Add paths
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/extras")
(add-to-list 'load-path "~/.emacs.d/lisp/extras/typewriter")

;; setup: pre
(require 'base-settings)
(require 'global-packages-setup)
(require 'zop-to-char)
(require 'typewriter-mode)

;; programming load
(require 'vutr-lsp)
(require 'vutr-org)
(require 'vutr-web)
(require 'vutr-python)
(require 'vutr-tide)
(require 'vutr-clojure)

;; setup: post
(require 'user-defined)
(require 'keybindings)
;;; vutr ends here
