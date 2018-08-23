(defvar executable-ag-available?
  (executable-find "ag"))

(use-package ag
  :ensure t
  :if executable-ag-available?
  :init
  (use-package wgrep-ag :ensure t)
  (setq-default ag-highlight-search t)
  :bind
  ("M-?" . ag-project))
