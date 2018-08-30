(use-package restclient
  :ensure t
  :init
  (use-package know-your-http-well :ensure t)
  (use-package company-restclient :ensure t)
  :hook (restclient-mode . linum-mode)
  :config
  (add-to-list 'company-backends 'company-restclient)
  (add-to-list 'auto-mode-alist '("\\.\\(http\\|api\\|rest\\)\\'" . restclient-mode)))
