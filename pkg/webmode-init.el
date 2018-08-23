(use-package web-mode
  :ensure t
  :init
  (use-package company-tern :ensure t)
  (use-package eslintd-fix :ensure t)
  ;; (use-package prettier-js :ensure t)
  (use-package xref-js2 :ensure t)
  (use-package emmet-mode
    :ensure t
    :config (setq emmet-expand-jsx-className? t
                  emmet-self-closing-tag-style " /"
                  emmet-move-cursor-between-quotes t))
  (use-package flycheck
    :ensure t
    :config
    (global-flycheck-mode 1)
    (with-eval-after-load 'flycheck
      (dolist (checker '(javascript-eslint))
        (flycheck-add-mode checker 'web-mode)))
    (setq-default flycheck-disabled-checkers
                  (append flycheck-disabled-checkers
                          '(javascript-jshint)))
    (setq-default flycheck-disabled-checkers
                  (append flycheck-disabled-checkers
                          '(json-jsonlist))))

  :config
  (add-hook 'web-mode-hook (lambda ()
                             (tern-mode)
                             (company-mode)
                             (add-to-list 'company-backends 'company-tern)
                             ;; (prettier-js-mode)
                             (eslintd-fix-mode t)
                             (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

  (add-hook 'flycheck-mode-hook #'use-eslint-from-node-modules)

  (set (make-local-variable 'company-backends)
       '(company-bbdb
         company-nxml company-css
         company-semantic company-files
         (company-dabbrev-code company-gtags company-etags company-keywords company-tern :with company-yasnippet)
         (company-dabbrev company-capf company-keywords :with company-yasnippet)))

  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-current-element-highlight t)

  (defadvice web-mode-highlight-part (around tweak-jsx activate)
    (if (equal web-mode-content-type "jsx")
        (let ((web-mode-enable-part-face nil))
          ad-do-it)
      ad-do-it))

  (global-set-key (kbd "C-q") 'emmet-expand-yas))

(defun use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(provide 'webmode-init)
;;; webmode-init.el ends here
