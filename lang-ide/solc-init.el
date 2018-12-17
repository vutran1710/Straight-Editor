(use-package solidity-mode
  :ensure t
  :mode (("\.sol$" . solidity-mode))
  :config
  (add-hook 'solidity-mode-hook
            (lambda ()
              (setq indent-tabs-mode nil)
              (setq tab-width 4))))
