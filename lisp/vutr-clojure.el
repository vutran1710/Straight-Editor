;;; vutr-clojure.el --- Clojure development environment setup -*- lexical-binding: t; -*-

;;; Commentary:
;; Comprehensive Clojure IDE setup with CIDER, refactoring tools,
;; syntax checking, and formatting capabilities.

;;; Code:

(defun vutr-clojure--mode-hook ()
  "Hook function for clojure-mode setup."
  (yas-reload-all)
  (yas-minor-mode)
  (eldoc-mode)
  (aggressive-indent-mode)
  (clj-refactor-mode)
  (add-hook 'before-save-hook #'vutr-clojure--before-save-hook nil t))

(defun vutr-clojure--config-cider ()
  "Configure CIDER settings for Clojure development."
  (setq clojure-indent-style 'align-arguments
        clojure-align-forms-automatically t
        cider-repl-pop-to-buffer-on-connect nil
        cider-repl-use-pretty-printing t
        cider-repl-history-file ".cider-repl-history"
        nrepl-log-messages t)
  (flycheck-clojure-setup))

(defun vutr-clojure--before-save-hook ()
  "Format Clojure buffer before saving."
  (when (eq major-mode 'clojure-mode)
    (cider-format-buffer)))

;; Package installations and configurations
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
  (clojure-mode . vutr-clojure--mode-hook)
  :config (vutr-clojure--config-cider))

(use-package clj-refactor
  :ensure t
  :diminish clj-refactor-mode
  :bind (("C-c C-m" . cljr-add-keybindings-with-prefix)))

(use-package kibit-helper
  :ensure t
  :bind (("C-x C-`" . kibit-accept-proposed-change)))

(provide 'vutr-clojure)
;;; vutr-clojure.el ends here
