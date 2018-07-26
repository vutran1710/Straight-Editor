;;; emacs-js.el --- JS-mode Setup                -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(require 'js2-mode)
(require 'js2-refactor)
(require 'tern)
(require 'xref-js2)
(require 'rjsx-mode)
(require 'eslintd-fix)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))

(setq-default js2-basic-indent 2
              js2-basic-offset 2
              js2-auto-indent-p t
              js2-cleanup-whitespace t
              js2-enter-indents-newline t
              js2-indent-on-enter-key t
              js2-global-externs (list "window" "module" "require" "buster" "sinon" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "jQuery" "$"))
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(defun setup-js-buffer ()
  (when (and (derived-mode-p 'js-mode) (not (derived-mode-p 'json-mode)))
    (tern-mode 1)
    (js2-minor-mode 1)
    (js2-refactor-mode 1)
    (js2-imenu-extras-mode)
    (eslintd-fix-mode 1)
    (my/use-eslint-from-node-modules))

  ;; add xref-js2 support
  (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)

  (setq js2-include-node-externs t)
  (setq js2-pretty-multiline-declarations nil)

  (set (make-local-variable 'company-dabbrev-ignore-case) nil)
  (set (make-local-variable 'company-dabbrev-downcase) nil))

;; We have JS files in Scripts directories, ignore that
(add-to-list 'xref-js2-ignored-dirs "public")

;; tern will override js2r keybindings...
(define-key tern-mode-keymap (kbd "C-c C-r") nil)

;; ... and xref.
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)

(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js-mode-map (kbd "M-.") nil)
(define-key js-mode-map (kbd "C-c C-j") nil)

;; eslint parser executable can be overridden in some projects but marked as
;; risky, so silence that.
(put 'flycheck-javascript-eslint-executable 'risky-local-variable nil)

(defun kill-tern-process ()
  "Kill the tern process if any.
The process will be restarted.  This is useful if tern becomes
unreachable."
  (interactive)
  (delete-process "Tern"))

(add-to-list 'company-backends 'company-tern)
(add-hook 'js-mode-hook #'setup-js-buffer)

(provide 'javascript-init.el)
;;; javascript-init.el ends here
