(defun setup-unicode ()
  "Unicode input for the buffer."
  (interactive)
  (company-mode)                        ; using company-mode
  (setq-local company-backends '(company-math-symbols-unicode))
  (setq-local company-minimum-prefix-length 1)
  (setq-local company-idle-delay 0))

(use-package ess
  :ensure t)

(use-package julia-mode
  :ensure t
  :config (setup-unicode)
  :mode ("\\.jl\\'" . julia-mode)
  :hook (julia-mode . 'latex-mode))

(provide 'vutr-julia)
