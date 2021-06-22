(use-package fountain-mode
  :ensure t
  :hook
  ((fountain-mode . (lambda()
                      (setq-local fill-column 80)
                      (auto-fill-mode)))))
