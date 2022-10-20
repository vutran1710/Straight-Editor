;;; package --- Summary
;;; Commentary:
;;; for Rust
;;; Code:

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("C-c C-c l" . flycheck-list-errors))
  :config
  (setq rustic-format-on-save t))


(provide 'vutr-rust)
;;; vutr-rust.el ends here
