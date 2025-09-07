;;; package --- Summary:
;;; Commentary:
;;; Clojure IDE setup
;;; Code:

;;; Custom config function
(defun custom-clj-mode-hook ()
  "Hook on clojure-mode."
  (yas-reload-all)
		    (yas-minor-mode)
		    (eldoc-mode)
		    (aggressive-indent-mode)
		    (clj-refactor-mode)
		    (add-hook 'before-save-hook #'clj-mode-before-save-hook))

(defun config-cider ()
  "Setup cider."
  (setq clojure-indent-style 'align-arguments)
  (setq clojure-align-forms-automatically t)
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (setq cider-repl-use-pretty-printing t)
  (setq cider-repl-history-file ".cider-repl-history"
	nrepl-log-messages t)
  (flycheck-clojure-setup))

(defun clj-mode-before-save-hook ()
  "Format clj file before save hook."
  (when (eq major-mode 'clojure-mode)
    (cider-format-buffer)))

;;; Install packages
(use-package clojure-mode
  :ensure t
  :config
  (require 'flycheck-clj-kondo))

(use-package flycheck-clojure
  :ensure t
  :after flycheck
  :defer t
  :commands (flycheck-clojure-setup)
  :config
  (eval-after-load 'flycheck
    '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(use-package flycheck-clj-kondo
  :ensure t)

(use-package flycheck-pos-tip
  :ensure t
  :after flycheck)

(use-package cider
  :ensure t
  :defer t
  :hook
  (clojure-mode . custom-clj-mode-hook)
  :config (config-cider))

(use-package clj-refactor
  :ensure t
  :diminish clj-refactor-mode
  :bind (("C-c C-m" . cljr-add-keybindings-with-prefix)))

(use-package kibit-helper
  :ensure t
  :bind (("C-x C-`" . kibit-accept-proposed-change)))

(provide 'vutr-clojure)
;;; vutr-clojure.el ends here
