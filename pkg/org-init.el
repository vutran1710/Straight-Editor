;;; package --- Summary:
;;; Commentary:
;;; Code:
(use-package org
  :ensure t
  :init (use-package ox-gfm
          :ensure t)
  :config
  (setq-default org-agenda-skip-unavailable-files t
                org-hide-leading-stars t
                org-image-actual-width nil
                org-startup-folded nil
                org-startup-indented t
                org-startup-with-inline-images t
                org-todo-keywords
                '((sequence "[ ](t)" "[-](p)" "[?](m)" "|" "[X](d)")
                  (sequence "TODO(T)" "|" "DONE(D)")
                  (sequence "NEXT(n)" "ACTIVE(a)" "WAITING(w)" "LATER(l)" "|" "CANCELLED(c)"))
                org-log-done 'time
                org-src-fontify-natively t)
  (add-hook 'after-save-hook 'org-to-md-save-hook)
  (add-hook 'org-mode-hook (lambda () (setq-local linum-format "  "))))

(defun org-to-md-save-hook ()
  "Auto save to README.md when org name is README."
  (when (string= (buffer-name) "README.org")
    (org-gfm-export-to-markdown)))

(provide 'org-init.el)
;;; org-init ends here
