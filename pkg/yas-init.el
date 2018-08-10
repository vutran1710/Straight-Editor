(use-package yasnippet
  :ensure t
  :after company
  :config

  ;; Adding yasnippet support to company
  (add-to-list 'company-backends '(company-yasnippet))

  ;; Activate global
  (yas-global-mode))

(use-package yasnippet-snippets
  :ensure t
  :after yasnippet
  )

(use-package ivy-yasnippet
  :ensure t
  :after yasnippet)
