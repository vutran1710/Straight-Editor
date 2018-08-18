(use-package company
  :ensure t
  :config
  ;; Global
  (setq company-idle-delay 0
        company-minimum-prefix-length 2
        company-show-numbers t
        company-tooltip-limit 20
        company-require-match nil
        company-dabbrev-downcase nil)


  ;; Facing
  (unless (face-attribute 'company-tooltip :background)
    (set-face-attribute 'company-tooltip nil :background "black" :foreground "gray40")
    (set-face-attribute 'company-tooltip-selection nil :inherit 'company-tooltip :background "gray15")
    (set-face-attribute 'company-preview nil :background "black")
    (set-face-attribute 'company-preview-common nil :inherit 'company-preview :foreground "gray40")
    (set-face-attribute 'company-scrollbar-bg nil :inherit 'company-tooltip :background "gray20")
    (set-face-attribute 'company-scrollbar-fg nil :background "gray40"))

  ;; Default backends
  (setq company-frontends '(company-pseudo-tooltip-unless-just-one-frontend
                            company-echo-metadata-frontend))
  (setq company-backends '((company-capf company-dabbrev-code company-files company-restclient) (company-elisp)))

  ;; Activating globally
  (global-company-mode t))


(use-package company-quickhelp
  :ensure t
  :after company
  :config
  (company-quickhelp-mode 1))
