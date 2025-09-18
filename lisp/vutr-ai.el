;;; vutr-ai.el --- Copilot Pro + Copilot Chat + Aider -*- lexical-binding: t; -*-

;;; Commentary:
;; One-stop AI module for Emacs:
;; - Copilot (inline ghost text) with GUI Super-key binds + TTY fallbacks
;; - Copilot Chat (side-panel agent)
;; - Aider (Aider UI; repo-aware diffs) via aider.el
;; Keybindings avoid your existing map (C-;, C-c n/k/m/r/d/h/b/q/1/2, C-c p*, C-c C-*, etc.)
;; and preserve Corfu's C-RET / M-RET.

;;; Code:

;;;; Environment PATH for macOS GUI Emacs
(use-package exec-path-from-shell
  :if (memq window-system '(mac ns x))
  :ensure t
  :init (exec-path-from-shell-initialize))

;; Helper to require an env var and set it in Emacs
(defun require-env (var)
  "Ensure VAR is set in the environment. Warn if missing."
  (let ((val (getenv var)))
    (if val
        (setenv var val)
      (warn "Environment variable %s is not set!" var))))

;;;; COPILOT: inline AI autocomplete
(use-package copilot
  :ensure t
  :hook (prog-mode . copilot-mode)   ;; add text-mode if you want prose help
  :custom
  (copilot-indent-offset-warning-disable t))

;; Simple toggle (doesn't clash with your map; also bound under C-c a t below)
(defun vutr/copilot-toggle ()
  "Toggle Copilot in current buffer."
  (interactive)
  (if (bound-and-true-p copilot-mode)
      (progn (copilot-mode -1) (message "Copilot: OFF"))
    (copilot-mode 1) (message "Copilot: ON")))

;;;; COPILOT CHAT: side-panel "AI agent"
(use-package copilot-chat
  :ensure t
  :commands (copilot-chat-display copilot-chat-ask copilot-chat-explain
                                  copilot-chat-fix copilot-chat-review copilot-chat-open copilot-chat-reset)
  :init
  (setq copilot-chat-frontend 'shell-maker))  ;; default UI + streaming

;;;; AIDER: Aider UI inside Emacs (repo-aware diff edits)
;; Install aider.el from GitHub using straight.el or manual installation
;; Prereq: `pipx install aider-chat` (or `pip install -U aider-chat`)
(use-package aider
  :ensure t
  :config
  (aider-magit-setup-transients) ;; add aider magit function to magit menu
  (global-auto-revert-mode 1)
  (auto-revert-mode 1))


;;; ------------------------------------------------------------------------
;;; --- Copilot guards for big/temp buffers ---
(defun vutr/copilot-too-large-or-temp-p ()
  (or (> (buffer-size) 200000)
      (string-match-p "\\`\\*temp\\*" (buffer-name))
      (minibufferp)))

(with-eval-after-load 'copilot
  (setq copilot-max-char 300000)  ;; optional; or remove if you prefer strict cutoff
  (add-to-list 'copilot-disable-predicates #'vutr/copilot-too-large-or-temp-p))


(provide 'vutr-ai)
;;; vutr-ai.el ends here
