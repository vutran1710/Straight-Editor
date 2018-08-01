;;; package --- Summary:
;;; Commentary:
;;; Code:
(use-package org
  :ensure t
  :init (use-package toc-org :ensure t)
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
  (add-hook 'org-mode-hook (lambda () (setq-local linum-format "  ")))
  (add-hook 'org-mode-hook 'toc-org-enable)
  (add-to-list 'org-tag-alist '("TOC" . ?T)))

(provide 'org-init.el)
;;; org-init ends here
