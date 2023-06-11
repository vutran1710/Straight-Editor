;;; package --- Summary:
;;; Commentary:
;;; python setup
;;; Code:

;; Custom tweaks
(defun setup-checkers (python-bin-path)
  "Setup checkers path depends on the location of virtualenv dir."
  (require 'flycheck)
  (setq flycheck-python-pylint-executable (concat python-bin-path "pylint"))
  (setq flycheck-python-flake8-executable (concat python-bin-path "flake8"))
  (setq flycheck-python-mypy-executable (concat python-bin-path "mypy"))
  (flycheck-add-next-checker 'python-flake8 'python-pylint)
  (flycheck-add-next-checker 'python-pylint 'python-mypy))

(defun find-venv-dir-and-setup-checkers ()
  "Look for .venv dir.  If exists, setup flycheck-checkers."
  (require 'projectile)
  (let ((venv-path (concat (projectile-project-root) ".venv")))
    (if (file-directory-p venv-path)
        (progn
          (pyvenv-activate venv-path)
          (setup-checkers (concat venv-path "/bin/"))
          (setq python-isort-command (concat venv-path "/bin/isort"))
          (setq blacken-executable (concat venv-path "/bin/black"))))))


;; Install stuffs
(use-package pyvenv
  :ensure t
  :diminish
  :hook
  (python-mode . (lambda()
                   (message "python set checking....")
                   (find-venv-dir-and-setup-checkers)
                   (blacken-mode)
                   (eglot-ensure)))
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
