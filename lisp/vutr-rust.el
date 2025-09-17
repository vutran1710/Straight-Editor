;;; package --- Summary
;;; Commentary:
;;; for Rust
;;; Code:

(use-package rustic
  :ensure t
  :init
  (setq rust-mode-treesitter-derive t)
  (setq rustic-lsp-client 'eglot)
  (setq rustic-format-on-save nil)                  ;; <— disable direct rustfmt
  (setq rustic-rustfmt-args "--edition 2024")       ;; harmless if using Eglot
  (setenv "RUST_LOG" "info")
  :custom
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer"))
  :hook
  ((rustic-mode . eglot-ensure)
   (eglot-managed-mode . (lambda ()
                           (setq eglot-inlay-hints-mode 0)
                           (add-hook 'before-save-hook #'eglot-format-buffer -10 t)))
   (rustic-mode . (lambda () (setq-local compile-command "cargo check"))))
  :bind
  (:map rustic-mode-map
        ("C-c C-c l" . (lambda ()
                         (interactive)
                         (if (fboundp 'flymake-show-buffer-diagnostics)
                             (flymake-show-buffer-diagnostics)
                           (message "Flymake UI not available."))))
        ("C-c C-c a" . eglot-code-actions)
        ("C-c C-c r" . eglot-rename)
        ("C-c C-c d" . eldoc)
        ("C-c C-c c" . rustic-cargo-check)
        ("C-c C-c t" . rustic-cargo-test)
        ("C-c C-c b" . rustic-cargo-build)))



(provide 'vutr-rust)
;;; vutr-rust.el ends here
