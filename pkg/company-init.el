(use-package company
  :ensure t
  :config
  (setq-default company-idle-delay 0
                company-dabbrev-other-buffers 'all
                company-minimum-prefix-length 3
                company-show-numbers nil
                company-tooltip-limit 20
                company-tooltip-align-annotations t
                company-require-match nil
                company-dabbrev-code-other-buffers 'all
                company-dabbrev-code-everywhere t
                company-echo-delay 0
                company-dabbrev-downcase nil)

  (setq company-frontends '(company-pseudo-tooltip-frontend company-echo-metadata-frontend))
  (setq company-backends
        '((company-dabbrev company-dabbrev-code company-capf company-files company-keywords)))

  (global-company-mode t)
  :hook (elisp-mode . (lambda ()
                        (add-to-list 'company-backends 'company-elisp))))

(use-package company-quickhelp
  :ensure t
  :after company
  :config
  (company-quickhelp-mode 1))

(use-package company-statistics
  :ensure t
  :after company
  :config
  (company-statistics-mode))
