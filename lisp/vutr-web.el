;;; package --- Summary
;;; Commentary:
;;; for web editing
;;; Code:

(use-package company-web
  :ensure t)

(use-package xref-js2
  :ensure t)

(use-package eslintd-fix
  :ensure t)

(use-package emmet-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.svelte\\'" . web-mode))
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


  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-current-element-highlight t
        indent-tabs-mode nil)

  :hook
  (flycheck-mode . use-eslint-from-node-modules)
  (web-mode . (lambda()
                (eslintd-fix-mode)
                (set (make-local-variable 'company-backends)
                     '(company-tide company-web-html company-css company-capf company-dabbrev company-files))
                (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

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
