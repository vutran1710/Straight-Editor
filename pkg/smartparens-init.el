(use-package smartparens-config
  :ensure smartparens
  :bind
  ("C-c C-y" . sp-beginning-of-sexp)
  ("C-c C-u" . sp-end-of-sexp)
  ("C-\"" . sp-unwrap-sexp)
  ("C-'" . sp-rewrap-sexp)
  ("C->" . sp-slurp-hybrid-sexp)
  ("C-]" . sp-mark-sexp)
  :config (smartparens-global-mode t))
