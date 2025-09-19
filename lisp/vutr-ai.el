;;; vutr-ai.el --- AI integration with Copilot, Chat, and Aider -*- lexical-binding: t; -*-

;;; Commentary:
;; One-stop AI module for Emacs providing:
;; - Copilot (inline ghost text) with GUI Super-key binds + TTY fallbacks
;; - Copilot Chat (side-panel agent)
;; - Aider (Aider UI; repo-aware diffs) via aider.el
;; Keybindings avoid existing mappings and preserve Corfu's C-RET / M-RET.

;;; Code:

;; Environment PATH for macOS GUI Emacs
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :init (exec-path-from-shell-initialize))

(defun vutr-ai--require-env (var)
  "Ensure environment variable VAR is set in the environment.
Warn if missing and return the value."
  (let ((val (getenv var)))
    (if val
        (setenv var val)
      (warn "Environment variable %s is not set!" var))
    val))

;; COPILOT: inline AI autocomplete
(use-package copilot
  :ensure t
  :hook (prog-mode . copilot-mode)
  :config
  (setq copilot-idle-delay 0.1)
  (setq copilot-indent-offset-warning-disable t))


;; COPILOT CHAT: side-panel "AI agent"
(use-package copilot-chat
  :ensure t
  :after copilot
  :config
  (setq copilot-chat-model "gpt-4"))

;;;###autoload
(defun vutr-ai/copilot-toggle ()
  "Toggle Copilot mode in current buffer."
  (interactive)
  (if (bound-and-true-p copilot-mode)
      (progn (copilot-mode -1) (message "Copilot: OFF"))
    (copilot-mode 1) (message "Copilot: ON")))

;; AIDER: Aider UI inside Emacs (repo-aware diff edits)
;; Prerequisite: `pipx install aider-chat` (or `pip install -U aider-chat`)
(use-package aider
  :ensure t
  :config
  (aider-magit-setup-transients) ;; add aider magit function to magit menu
  (global-auto-revert-mode 1)
  (auto-revert-mode 1))

;; Copilot guards for big/temp buffers
(defun vutr-ai--copilot-too-large-or-temp-p ()
  "Return non-nil if current buffer should not use Copilot.
Checks for buffer size, temporary buffers, and minibuffers."
  (or (> (buffer-size) 200000)
      (string-match-p "\\`\\*temp\\*" (buffer-name))
      (minibufferp)))

(with-eval-after-load 'copilot
  (setq copilot-max-char 300000)  ;; optional; or remove if you prefer strict cutoff
  (add-to-list 'copilot-disable-predicates #'vutr-ai--copilot-too-large-or-temp-p))

;; Keybinding setup
(define-prefix-command 'vutr-ai-map)
(global-set-key (kbd "C-c a") 'vutr-ai-map)
(define-key vutr-ai-map (kbd "t") #'vutr-ai/copilot-toggle)
(define-key vutr-ai-map (kbd "a") #'copilot-accept-completion)

(provide 'vutr-ai)
;;; vutr-ai.el ends here
