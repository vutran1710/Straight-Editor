(use-package anzu
  :ensure t
  :hook (after-init . global-anzu-mode)
  :bind (([remap query-replace] . anzu-query-replace)
         ([remap query-replace-regexp] . anzu-query-replace-regexp)
         ("M-r" . anzu-query-replace-at-cursor)))
