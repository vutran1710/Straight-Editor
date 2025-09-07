;;; package --- Summary
;;; Commentary:
;;; for Rust
;;; Code:

(eval-when-compile
  (require 'use-package))

(defun vutr-rust--maybe-disable-flycheck ()
  "Disable `flycheck-mode' when using `eglot'."
  (when (bound-and-true-p eglot--managed-mode)
    (flycheck-mode -1)))

(use-package rustic
  :ensure t
  :hook (rustic-mode . (lambda ()
                         (eglot-ensure)
                         (vutr-rust--maybe-disable-flycheck)))
  :init
  (setq rustic-lsp-client 'eglot)
  :bind (:map rustic-mode-map
              ("C-c C-c l" . flymake-show-project-diagnostics))
  :config
  (setq rustic-format-on-save t
        rustic-rustfmt-args "+nightly")
  (setenv "RUST_LOG" "info"))


(provide 'vutr-rust)
;;; vutr-rust.el ends here
