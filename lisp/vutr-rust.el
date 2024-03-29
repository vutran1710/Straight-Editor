;;; package --- Summary
;;; Commentary:
;;; for Rust
;;; Code:

(use-package rustic
  :ensure t
  :init
  (setq rustic-lsp-client 'eglot)
  :bind (:map rustic-mode-map
              ("C-c C-c l" . flycheck-list-errors))
  :config
  (setq rustic-format-on-save t)
  (setq rustic-rustfmt-args "+nightly")
  (setenv "RUST_LOG" "info"))


(provide 'vutr-rust)
;;; vutr-rust.el ends here
