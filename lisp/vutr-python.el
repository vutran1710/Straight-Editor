;;; vutr-python.el --- Python development environment setup -*- lexical-binding: t; -*-

;;; Commentary:
;; Python IDE setup with virtual environment support, linting,
;; formatting, and testing capabilities.

;;; Code:

(defun vutr-python--setup-checkers (python-bin-path)
  "Setup checker executables based on PYTHON-BIN-PATH from virtualenv."
  (require 'flycheck)
  (setq flycheck-python-pylint-executable (concat python-bin-path "pylint")
        flycheck-python-flake8-executable (concat python-bin-path "flake8")
        flycheck-python-mypy-executable (concat python-bin-path "mypy"))
  (flycheck-add-next-checker 'python-flake8 'python-pylint)
  (flycheck-add-next-checker 'python-pylint 'python-mypy))

(defun vutr-python--find-venv-and-setup ()
  "Look for .venv directory and setup flycheck checkers if found."
  (require 'projectile)
  (let ((venv-path (concat (projectile-project-root) ".venv")))
    (when (file-directory-p venv-path)
      (pyvenv-activate venv-path)
      (vutr-python--setup-checkers (concat venv-path "/bin/"))
      (setq python-isort-command (concat venv-path "/bin/isort")
            blacken-executable (concat venv-path "/bin/black")))))

(defun vutr-python--mode-hook ()
  "Setup function for python-mode."
  (message "Python mode: setting up checking...")
  (vutr-python--find-venv-and-setup)
  (blacken-mode)
  (eglot-ensure))

;; Package installations and configurations
(use-package pyvenv
  :ensure t
  :diminish
  :hook
  (python-mode . vutr-python--mode-hook)
  :config
  (pyvenv-mode +1)
  (pyvenv-tracking-mode +1))

(use-package poetry
  :ensure t
  :defer t
  :config
  (setq poetry-tracking-strategy 'switch-buffer)
  :hook (python-mode . eglot-ensure))

(use-package blacken
  :ensure t
  :hook (python-mode . blacken-mode))

(use-package python-isort
  :ensure t
  :hook (python-mode . python-isort-on-save-mode))

(use-package python-pytest
  :ensure t)

(provide 'vutr-python)
;;; vutr-python.el ends here
