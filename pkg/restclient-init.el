(use-package restclient
  :ensure t
  :init
  (use-package know-your-http-well :ensure t)
  (use-package company-restclient :ensure t)
  :hook
  (restclient-mode . linum-mode)
  :config
  (set (make-local-variable 'company-backends)
       '(company-dabbrev-code company-dabbrev company-restclient company-semantic company-files
                              (company-dabbrev-code company-keywords)
                              (company-dabbrev company-capf company-keywords)))
  (add-to-list 'auto-mode-alist '("\\.http\\'" . restclient-mode))
  (add-to-list 'auto-mode-alist '("\\.api\\'" . restclient-mode))
  (add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode)))
