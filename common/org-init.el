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
  (add-hook 'org-mode-hook (lambda ()
                             (setq-local linum-format "  ")
                             (toc-org-enable)
                             (yas-minor-mode-on)
                             ;; Special key bindings
                             (global-set-key (kbd "C-c c c") 'org-capture)))
  (add-to-list 'org-tag-alist '("TOC" . ?T))
  (setq org-hide-emphasis-markers t)
  (setq org-cycle-include-plain-lists 'integrate)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (shell . t)
     (python . t)
     (dot . t)
     )))

(provide 'org-init.el)
;;; org-init ends here
