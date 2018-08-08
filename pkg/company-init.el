(use-package company-tern :ensure t)
(use-package company-jedi :ensure t)
(use-package company-restclient :ensure t)

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :bind (("M-/" . company-complete-common-or-cycle)
         ("C-x C-p" . company-files)
         :map company-active-map
         ("<tab>" . company-complete-common-or-cycle)
         ("M-n" . company-select-next-or-abort)
         ("M-p" . company-select-previous-or-abort))
  :config
  (add-hook 'after-init 'global-company-mode)
  (setq company-minimum-prefix-length 3
        company-require-match nil
        company-idle-delay nil
        company-tooltip-align-annotations t
        company-echo-delay 0
        company-frontends
        '(company-pseudo-tooltip-unless-just-one-frontend
          company-echo-metadata-frontend)
        company-backends
        '((company-capf company-dabbrev-code
                        :with
                        company-yasnippet
                        company-restclient
                        company-tern
                        company-jedi
                        company-files))))

(use-package company-buffer-line
  :commands (company-same-mode-buffer-lines)
  :bind ("C-x C-l" . company-same-mode-buffer-lines))

(use-package company-statistics
  :ensure t
  :defer t
  :hook (global-company-mode . company-statistics-mode))
