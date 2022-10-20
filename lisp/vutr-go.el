;;; package --- Summary:
;;; Commentary:
;;; go setup
;;; Code:

(use-package flycheck-golangci-lint
  :ensure t
  :config (setq flycheck-golangci-lint-enable-all t))

(use-package go-mode
  :ensure t
  :config
  (gofmt-before-save)
  :hook (go-mode . (lambda()
                     (flycheck-golangci-lint-setup)
                     (set (make-local-variable 'flycheck-checkers)
                          '(golangci-lint))
                     (setq-default indent-tabs-mode nil)
                     (setq-default tab-width 4)
                     (setq indent-line-function 'insert-tab))))


(use-package gotest
  :ensure t)


(provide 'vutr-go)
;;; vutr-go.el ends here
