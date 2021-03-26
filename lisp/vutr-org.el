;;; package --- Summary:
;;; Commentary:
;;; Org-mode setup
;;; Code:


(use-package org
  :ensure t
  :after yasnippet
  :hook
  (org-mode . (lambda ()
		(yas-minor-mode-on)
		(visual-line-mode)))
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

  (setq org-cycle-include-plain-lists 'integrate
	org-hide-emphasis-markers t
	org-directory "~/Works/Org"
	org-default-notes-file (concat org-directory "/notes.org"))

  (add-to-list 'org-tag-alist '("TOC" . ?T))

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (shell . t)
     (python . t)
     (dot . t)
     ))

  (setq org-capture-templates
	'(("d" "Draft" entry (file+datetree "~/Works/Org/draft.org")
	   "* %? %^G\nEntered on %U\n")))

  (font-lock-add-keywords 'org-mode
			  '(("^ *\\([-]\\) "
			     (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))



  (let* ((variable-tuple
	  (cond ((x-list-fonts   "Source Sans Pro") '(:font   "Source Sans Pro"))
		((x-list-fonts   "Lucida Grande")   '(:font   "Lucida Grande"))
		((x-list-fonts   "Verdana")         '(:font   "Verdana"))
		((x-family-fonts "Sans Serif")      '(:family "Sans Serif"))
		(nil (warn "Cannot find a Sans Serif Font."))))
	 (headline `(:weight bold)))

    (custom-theme-set-faces
     'user
     `(org-level-8        ((t (,@headline ,@variable-tuple))))
     `(org-level-7        ((t (,@headline ,@variable-tuple))))
     `(org-level-6        ((t (,@headline ,@variable-tuple))))
     `(org-level-5        ((t (,@headline ,@variable-tuple))))
     `(org-level-4        ((t (,@headline ,@variable-tuple :height 1.1))))
     `(org-level-3        ((t (,@headline ,@variable-tuple :height 1.2))))
     `(org-level-2        ((t (,@headline ,@variable-tuple :height 1.5))))
     `(org-level-1        ((t (,@headline ,@variable-tuple :height 1.7))))
     `(org-headline-done  ((t (,@headline ,@variable-tuple :strike-through t))))
     `(org-document-title ((t (,@headline ,@variable-tuple
					  :height 1.8 :underline nil))))))

  )

(use-package toc-org
  :ensure t
  :after org
  :hook
  (org-mode . toc-org-enable))

(use-package org-bullets
  :ensure t
  :after org
  :hook
  (org-mode . org-bullets-mode))

(use-package org-fancy-priorities
  :ensure t
  :after org
  :hook
  (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")))

(provide 'vutr-org)
;;; vutr-org ends here
