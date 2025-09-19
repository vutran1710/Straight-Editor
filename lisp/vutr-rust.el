;;; vutr-rust.el --- rust-ts-mode + Eglot + built-in cargo cmds -*- lexical-binding: t; -*-

(require 'use-package)

;; Always open Rust files in rust-ts-mode
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))

;;;; Helpers
(defun vutr/rust-project-root ()
  "Best-effort project root (Cargo.toml > project.el > default)."
  (or (locate-dominating-file default-directory "Cargo.toml")
      (when-let ((pr (project-current nil))) (project-root pr))
      default-directory))

(defun vutr/cargo (subcmd)
  "Run `cargo SUBCMD' from the project root using `compile'."
  (let ((default-directory (vutr/rust-project-root)))
    (save-some-buffers t)
    (compile (format "cargo %s" subcmd))))

(defun vutr/cargo-check  () (interactive) (vutr/cargo "check"))
(defun vutr/cargo-build  () (interactive) (vutr/cargo "build"))
(defun vutr/cargo-test   () (interactive) (vutr/cargo "test --all"))
(defun vutr/cargo-run    () (interactive) (vutr/cargo "run"))
(defun vutr/cargo-clippy () (interactive) (vutr/cargo "clippy --all-targets -- -D warnings"))
(defun vutr/cargo-fmt    () (interactive) (vutr/cargo "+nightly fmt"))

(defun vutr/rust-show-diagnostics ()
  (interactive)
  (if (fboundp 'flymake-show-buffer-diagnostics)
      (flymake-show-buffer-diagnostics)
    (user-error "Flymake UI not available (need Emacs 29+)")))

(defun vutr/rust-eldoc ()
  (interactive)
  (if (fboundp 'eldoc-doc-buffer)
      (eldoc-doc-buffer)
    (eldoc-print-current-symbol-info)))

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
    (define-key m (kbd "C-c C-c f") #'rustic-cargo-test-current-file) ;; file’s tests
    (define-key m (kbd "C-c C-c R") #'rustic-cargo-run)
    (define-key m (kbd "C-c C-c C") #'rustic-cargo-clippy)
    (define-key m (kbd "C-c C-c F") #'rustic-cargo-fmt)))

;; Convenient default compile command in Rust buffers
(add-hook 'rust-ts-mode-hook
          (lambda ()
            (setq-local compile-command "cargo check")))

;; Turn off eglot-inlay-hints-mode by default
(add-hook 'eglot-managed-mode-hook
          (lambda ()
            (eglot-inlay-hints-mode -1)))

(provide 'vutr-rust)
;;; vutr-rust.el ends here
