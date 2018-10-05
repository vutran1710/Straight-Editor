(use-package dumb-jump
  :bind (("C-c j o" . dumb-jump-go-other-window)
         ("C-c j j" . dumb-jump-go)
         ("C-c j i" . dumb-jump-go-prompt))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)
