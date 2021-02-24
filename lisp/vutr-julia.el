;;; package --- Summary:
;;; Commentary:
;;; julia setup
;;; Code:

(use-package julia-mode
  :ensure t
  :config
  (setq default-input-method "TeX")
  (setq smartparens-strict-mode nil))

(provide 'vutr-julia)
;;; vutr-julia ends here
