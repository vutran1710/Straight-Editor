;;; vutr-rust.el --- rust-ts-mode + Eglot + built-in cargo cmds -*- lexical-binding: t; -*-

(require 'use-package)

;; Always open Rust files in rust-ts-mode
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))

;;;; LSP with eglot
(use-package eglot
  :ensure t
  :hook (rust-ts-mode . eglot-ensure)
  :config
  ;; Make sure eglot uses rust-analyzer via rustup stable (if PATH isn’t enough)
  (add-to-list 'eglot-server-programs
               '((rust-ts-mode rust-mode)
                 . ("rustup" "run" "stable" "rust-analyzer")))
  ;; Enable auto-format on save via rust-analyzer
  (add-hook 'eglot-managed-mode-hook
            (lambda ()
              (add-hook 'before-save-hook #'eglot-format-buffer -10 t)))
  ;; Turn off inlay hints by default if you don’t like them
  (add-hook 'eglot-managed-mode-hook
            (lambda () (eglot-inlay-hints-mode -1))))

;;; Cargo integration via rustic
(use-package rustic
  :ensure t
  :mode nil
  :after (rust-mode)
  :custom
  (rustic-analyzer-command '("rustup" "run" "stable" "rust-analyzer"))
  :init
  ;; Prevent rustic from auto-taking over .rs buffers
  (setq rust-mode-treesitter-derive nil
        rustic-lsp-client nil
        rustic-format-on-save nil))

;; Keybindings for rust-ts-mode
(with-eval-after-load 'rust-ts-mode
  (let ((m rust-ts-mode-map))
    ;; LSP / diagnostics
    (define-key m (kbd "C-c C-c l") #'flymake-show-buffer-diagnostics)
    (define-key m (kbd "C-c C-c a") #'eglot-code-actions)
    (define-key m (kbd "C-c C-c r") #'eglot-rename)
    (define-key m (kbd "C-c C-c d") #'eldoc-doc-buffer)

    ;; Cargo via rustic
    (define-key m (kbd "C-c C-c c") #'rustic-cargo-check)
    (define-key m (kbd "C-c C-c b") #'rustic-cargo-build)
    (define-key m (kbd "C-c C-c t") #'rustic-cargo-test)              ;; all tests
    (define-key m (kbd "C-c C-c u") #'rustic-cargo-current-test)      ;; <— test at point
    (define-key m (kbd "C-c C-c R") #'rustic-cargo-run)
    (define-key m (kbd "C-c C-c C") #'rustic-cargo-clippy)
    (define-key m (kbd "C-c C-c F") #'rustic-cargo-fmt)))


(provide 'vutr-rust)
;;; vutr-rust.el ends here
