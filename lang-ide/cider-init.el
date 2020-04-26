(use-package aggressive-indent
  :ensure t)

(use-package clojure-mode
  :ensure t)

(use-package flycheck-clojure
  :after flycheck
  :defer t
  ;; :commands (flycheck-clojure-setup)               ;; autoload
  :config
  (eval-after-load 'flycheck
    '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(use-package flycheck-pos-tip :ensure t
  :after flycheck)

(defun clj-mode-before-save-hook ()
  (when (eq major-mode 'clojure-mode)
    (cider-format-buffer)))

(use-package cider
  :ensure t
  :hook
  (clojure-mode . (lambda()
                    (yas-reload-all)
                    (yas-minor-mode)
                    (eldoc-mode)
                    (aggressive-indent-mode)
                    (add-hook 'before-save-hook #'clj-mode-before-save-hook)))
  :config
  (setq clojure-indent-style 'align-arguments)
  (setq clojure-align-forms-automatically t)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (setq
   cider-repl-history-file ".cider-repl-history"  ;; not squiggly-related, but I like it
   nrepl-log-messages t))

(use-package clj-refactor
  :ensure t
  :diminish clj-refactor-mode
  :hook (clojure-mode . clj-refactor-mode)
  :config
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package kibit-helper
  :ensure t
  :bind (("C-x C-`" . kibit-accept-proposed-change)))
