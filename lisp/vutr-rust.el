;;; package --- Summary
;;; Commentary:
;;; for Rust
;;; Code:

(use-package rustic
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t)
  (setq rustic-lsp-client 'eglot)

  :bind (:map rustic-mode-map
              ("C-c C-c l" . flycheck-list-errors))

  :config
  (setq rustic-format-on-save t)
  (setq rustic-rustfmt-args "+nightly")
  (setenv "RUST_LOG" "info")

  :custom
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer")))


(provide 'vutr-rust)
;;; vutr-rust.el ends here
