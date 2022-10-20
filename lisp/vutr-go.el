;;; package --- Summary:
;;; Commentary:
;;; go setup
;;; Code:

(use-package flycheck-golangci-lint
  :ensure t
  :config (setq flycheck-golangci-lint-enable-all t))

(use-package go-mode
  :ensure t
  :hook ((before-save . (lambda()
                          (when (eq major-mode 'go-mode) (gofmt))))
         (go-mode . (lambda()
                      (flycheck-golangci-lint-setup)
                      (set (make-local-variable 'flycheck-checkers)
                           '(golangci-lint))
                      (gofmt-before-save)
                      (setq-default indent-tabs-mode nil)
                      (setq-default tab-width 4)
                      (setq indent-line-function 'insert-tab)))))


(use-package gotest
  :ensure t)

(provide 'vutr-go)
;;; vutr-go.el ends here
