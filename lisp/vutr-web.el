;;; package --- Summary
;;; Commentary:
;;; for web editing
;;; Code:

(use-package company-web
  :ensure t)

(use-package eslintd-fix
  :ensure t)

(use-package emmet-mode
  :ensure t
  :config (setq emmet-expand-jsx-className? t
		emmet-self-closing-tag-style " /"
		emmet-move-cursor-between-quotes t))

(use-package web-mode
  :ensure t
  :config

  (with-eval-after-load 'flycheck
    (dolist (checker '(javascript-eslint))
      (flycheck-add-mode checker 'web-mode)))

  (setq-default flycheck-disabled-checkers
		(append flycheck-disabled-checkers
			'(javascript-jshint json-jsonlist)))

  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))

  (setq web-mode-engines-alist '(("django" . "\\.html\\'"))
	web-mode-markup-indent-offset 2
	web-mode-code-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-enable-auto-pairing t
	web-mode-enable-css-colorization t
	web-mode-enable-current-element-highlight t)
  :hook
  (flycheck-mode . use-eslint-from-node-modules)
  (web-mode . (lambda()
		(company-mode)
		(eslintd-fix-mode)
		(set (make-local-variable 'company-backends)
		     '(company-capf company-dabbrev company-css company-web company-files))
		)))

;; Make use of local Eslint over global
(defun use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
		(or (buffer-file-name) default-directory)
		"node_modules"))
	 (eslint (and root
		      (expand-file-name "node_modules/eslint/bin/eslint.js"
					root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(provide 'vutr-web)
;;; vutr-web.el ends here
