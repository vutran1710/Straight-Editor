(use-package tide
  :ensure t
  :init (use-package web-mode :ensure t)
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (add-hook 'web-mode-hook
            (lambda ()
              (when (string-equal "tsx" (file-name-extension buffer-file-name))
                (setup-tide-mode))))

  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(defun my/use-tslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (tslint (and root
                      (expand-file-name "node_modules/tslint/bin/tslint.js"
                                        root))))
    (when (and tslint (file-executable-p tslint))
      (setq-local flycheck-javascript-tslint-executable tslint))))

(defun company-tide-mode-hook ()
  (set (make-local-variable 'company-backends)
       '(company-css company-web company-tern company-semantic company-files
                     (company-dabbrev-code company-gtags company-etags company-keywords company-tern)
                     (company-dabbrev company-capf company-keywords))))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (company-tide-mode-hook)
  (eldoc-mode +1)
  (yas-reload-all)
  (tide-hl-identifier-mode +1)
  (my/use-tslint-from-node-modules))
