(use-package elm-mode
    :ensure t
    :config
    (setq elm-format-on-save t)
    (add-to-list 'company-backends 'company-elm))
