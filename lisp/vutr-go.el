;;; package --- Summary:
;;; Commentary:
;;; go setup
;;; Code:

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(use-package flycheck-golangci-lint
  :ensure t
  :config (setq flycheck-golangci-lint-enable-all t))

(use-package go-mode
  :ensure t
  :init
  :hook (go-mode . (lambda()
                     (lsp-deferred)
                     (lsp-go-install-save-hooks)
                     (flycheck-golangci-lint-setup)
                     (set (make-local-variable 'flycheck-checkers)
                          '(lsp-ui
                            golangci-lint))
                     (setq-default indent-tabs-mode nil)
                     (setq-default tab-width 4)
                     (setq indent-line-function 'insert-tab)
                     )))


(use-package gotest
  :ensure t)


(provide 'vutr-go)
;;; vutr-go.el ends here
