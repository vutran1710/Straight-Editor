;;; package --- Summary:
;;; Commentary:
;;; lsp setup
;;; Code:

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (python-mode . lsp-deferred)
  :commands (lsp lsp-deferred))

(provide 'vutr-lsp)
;;; vutr-lsp ends here
