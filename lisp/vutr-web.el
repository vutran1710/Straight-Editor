;;; vutr-web.el --- Web development environment setup -*- lexical-binding: t; -*-

;;; Commentary:
;; Comprehensive web development setup for JavaScript, TypeScript, HTML, CSS,
;; and related technologies with formatting, linting, and IDE features.

;;; Code:

(defun vutr-web--locate-node-modules ()
  "Find the proper node_modules directory for current project."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "package.json"))
         (node-modules-dir (expand-file-name "node_modules" root)))
    node-modules-dir))

(defun vutr-web--setup-executables (node-dir)
  "Setup executables for prettier, eslint, eslintd from NODE-DIR."
  (interactive)
  (setq-local flycheck-javascript-eslint-executable
              (expand-file-name "eslint/bin/eslint.js" node-dir))
  (setq-local prettier-js-command
              (expand-file-name "prettier/bin-prettier.js" node-dir))
  (setq-local eslintd-fix-executable
              (expand-file-name "eslint_d/bin/eslint_d.js" node-dir)))

(defun vutr-web--config-flycheck ()
  "Setup flycheck configuration for web-mode."
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint json-jsonlist))))

(defun vutr-web--mode-hook ()
  "Hook function for web-mode setup."
  (vutr-web--setup-executables (vutr-web--locate-node-modules))
  (vutr-web--config-flycheck))

(defun vutr-web--emmet-jsx-hook ()
  "Setup Emmet for JSX files."
  (when (member (file-name-extension buffer-file-name) '("tsx" "jsx"))
    (setq-local emmet-expand-jsx-className? t)))

(defun vutr-web--tide-hook ()
  "Setup Tide for TypeScript and JSX files."
  (when (member (file-name-extension buffer-file-name) '("tsx" "jsx" "ts" "js"))
    (tide-setup)
    (set (make-local-variable 'flycheck-checkers)
         '(javascript-eslint
           typescript-tide
           tsx-tide
           jsx-tide))))

(defun vutr-web--prettier-hook ()
  "Setup Prettier for web files."
  (when (member (file-name-extension buffer-file-name) 
                '("tsx" "jsx" "ts" "js" "scss" "css" "sass"))
    (prettier-js-mode)))

;; Package installations and configurations
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
  (web-mode . vutr-web--emmet-jsx-hook))

(use-package sass-mode
  :ensure t)

(use-package tide
  :ensure t
  :config
  (setq typescript-indent-level 2)
  :hook
  (before-save . tide-format-before-save)
  (web-mode . vutr-web--tide-hook))

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
  (web-mode . vutr-web--mode-hook))

(use-package prettier-js
  :ensure t
  :after (web-mode)
  :hook
  (web-mode . vutr-web--prettier-hook))

(provide 'vutr-web)
;;; vutr-web.el ends here
