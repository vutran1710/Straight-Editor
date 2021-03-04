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
  :diminish "🌎"
  :mode
  (("\\.phtml\\'" . web-mode)
   ("\\.erb\\'" . web-mode)
   ("\\.mustache\\'" . web-mode)
   ("\\.djhtml\\'" . web-mode)
   ("\\.jst.ejs\\'" . web-mode)
   ("\\.tsx\\'" . web-mode)
   ("\\.s?css\\'" . web-mode)
   ("\\.html?\\'" . web-mode))
  :init
  (setq web-mode-enable-block-face t)
  (setq web-mode-enable-comment-keywords t)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-current-column-highlight t)
  (setq web-mode-script-padding 2)
  (setq web-mode-style-padding 2)
  (setq web-mode-comment-style 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-markup-indent-offset 2))


(use-package web-mode
  :ensure t
  :config
  (with-eval-after-load 'flycheck
    (dolist (checker '(javascript-eslint))
      (flycheck-add-mode checker 'web-mode)))

  (setq-default flycheck-disabled-checkers
		(append flycheck-disabled-checkers
			'(javascript-jshint json-jsonlist)))

  (add-hook 'flycheck-mode-hook #'use-eslint-from-node-modules)

  ;; Auto-complete for webmode
  (defun company-web-mode-hook ()
    (set (make-local-variable 'company-backends)
	 '(company-capf company-dabbrev company-css company-web company-files)))

  (add-hook 'web-mode-hook (lambda ()
			     (tern-mode)
			     (company-mode)
			     (company-web-mode-hook)
			     (eslintd-fix-mode)
			     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

  ;; Emacs 27 already support jsx
  ;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2
	web-mode-code-indent-offset 2
	web-mode-css-indent-offset 2
	web-mode-enable-auto-pairing t
	web-mode-enable-css-colorization t
	web-mode-enable-current-element-highlight t))

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

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (company-tide-mode-hook)
  (tide-hl-identifier-mode +1)
  (setq typescript-indent-level '2)
  (use-eslint-from-node-modules))

(use-package tide
  :ensure t
  :after (web-mode)
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
