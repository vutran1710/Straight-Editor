;;; package --- Summary
;;; Commentary:
;;; for Typescript
;;; Code:

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (company-tide-mode-hook)
  (tide-hl-identifier-mode +1))


(use-package tide
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
	    (lambda ()
	      (when (string-equal "tsx" (file-name-extension buffer-file-name))
		(setup-tide-mode))))

  (defun company-tide-mode-hook ()
    (set (make-local-variable 'company-backends)
	 '(company-capf company-tide company-dabbrev-code company-css company-files)))

  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))


(provide 'vutr-tide)
;;; vutr-tide.el ends here
