;;; package --- Summary
;;; Commentary:
;;; for web editing
;;; Code:


(defun locate-node-modules ()
  "Find the proper node-modules"
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "package.json"))
         (node-modules-dir (expand-file-name "node_modules" root)))
    node-modules-dir))


(defun setup-executables (node-dir)
  "Setup executables for prettier, eslint, eslintd."
  (interactive)
  (setq-local flycheck-javascript-eslint-executable
              (expand-file-name "eslint/bin/eslint.js" node-dir))
  (setq-local prettier-js-command
              (expand-file-name "prettier/bin-prettier.js" node-dir))
  (setq-local eslintd-fix-executable
              (expand-file-name "eslint_d/bin/eslint_d.js" node-dir)))


(defun config-company ()
  "Setup company-backends."
  (setq-local company-backends
              '(company-tide
                company-web-html
                company-css
                company-capf)))


(defun config-flycheck ()
  "Setup flycheck on web-mode."
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint json-jsonlist))))

(use-package company-web
  :ensure t)

(use-package xref-js2
  :ensure t)

(use-package eslintd-fix
  :ensure t
  :hook (tide-mode . eslintd-fix-mode))

(use-package emmet-mode
  :ensure t
  :config
  (setq emmet-self-closing-tag-style " /"
        emmet-move-cursor-between-quotes t)
  (add-to-list 'emmet-jsx-major-modes 'web-mode)
  :hook
  (web-mode . (lambda ()
                (when (member (file-name-extension buffer-file-name) '("tsx" "jsx"))
                  (setq-local emmet-expand-jsx-className? t)))))

(use-package sass-mode
  :ensure t)

(use-package tide
  :ensure t
  :config
  (setq typescript-indent-level '2)
  :hook
  (before-save . tide-format-before-save)
  (web-mode . (lambda ()
                (when (member (file-name-extension buffer-file-name) '("tsx" "jsx" "ts" "js"))
                  (tide-setup)
                  (set (make-local-variable 'flycheck-checkers)
                       '(javascript-eslint
                         typescript-tide
                         tsx-tide
                         jsx-tide))))))

(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.s?css\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.svelte\\'" . web-mode))

  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-current-element-highlight t
        indent-tabs-mode nil)
  :hook
  (web-mode . (lambda()
                (config-company)
                (setup-executables (locate-node-modules))
                (config-flycheck))))

(use-package prettier-js
  :ensure t
  :after (web-mode)
  :hook
  (web-mode . (lambda ()
                (when (member (file-name-extension buffer-file-name) '("tsx" "jsx" "ts" "js" "scss" "css" "sass"))
                  (prettier-js-mode)))))

(provide 'vutr-web)
;;; vutr-web.el ends here
