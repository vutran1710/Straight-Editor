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
  (copilot-indent-offset-warning-disable t)
  :bind
  ;; GUI-first bindings (Super/Command). These do not collide with your keys.
  (:map copilot-completion-map
        ([s-return]    . copilot-accept-completion)         ;; ⌘↩ accept
        ([s-/]         . copilot-accept-completion-by-word) ;; ⌘/  accept word
        ([s-|]         . copilot-accept-completion-by-line) ;; ⌘|  accept line
        ([s-n]         . copilot-next-completion)           ;; ⌘n  next
        ([s-p]         . copilot-previous-completion)       ;; ⌘p  prev
        ([s-g]         . copilot-clear-overlay)             ;; ⌘g  dismiss
        ;; TTY fallbacks via AI prefix (see dedicated key section below):
        ("C-c a a"     . copilot-accept-completion)
        ("C-c a w"     . copilot-accept-completion-by-word)
        ("C-c a l"     . copilot-accept-completion-by-line)
        ("C-c a n"     . copilot-next-completion)
        ("C-c a p"     . copilot-previous-completion)
        ("C-c a g"     . copilot-clear-overlay)))

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
  :ensure nil  ;; Install via straight.el or manually
  :if (executable-find "aider")
  :commands (aider-start aider-send-message aider-add-file aider-remove-file
                         aider-commit aider-undo aider-clear aider-exit)
  :custom
  (aider-executable "aider")
  (aider-model "sonnet")  ;; or "gpt-4", "claude-3-sonnet", etc.
  (aider-args '("--editor" "emacs"))
  :init
  ;; Set up API keys for Copilot
  (require-env "OPENAI_API_KEY")
  (setenv "OPENAI_API_BASE" "https://api.githubcopilot.com")
  :config
  ;; Optional: Auto-add current file when starting aider
  (defun vutr/aider-start-with-current-file ()
    "Start Aider and add the current file to context."
    (interactive)
    (aider-start)
    (when (buffer-file-name)
      (aider-add-file (buffer-file-name))))

  ;; Optional: Quick commit with message
  (defun vutr/aider-quick-commit (message)
    "Commit current changes with MESSAGE via Aider."
    (interactive "sCommit message: ")
    (aider-send-message (format "/commit %s" message)))

  ;; Installation helper for straight.el users
  ;; Add this to your init.el if you use straight.el:
  ;; (straight-use-package
  ;;  '(aider :type git :host github :repo "tninja/aider.el"))

  (defun vutr/aider-diagnose ()
    "Quick checks to help Aider run smoothly."
    (interactive)
    (message "aider on PATH? %s | git repo? %s | OPENAI_API_KEY? %s"
             (or (executable-find "aider") "NO")
             (or (ignore-errors (project-root (project-current))) "NO project")
             (if (getenv "OPENAI_API_KEY") "yes" "no")))

  (defun vutr/aider-install-instructions ()
    "Show installation instructions for aider.el."
    (interactive)
    (with-help-window "*Aider Installation*"
      (princ "Aider.el is installed from MELPA!\n\n")
      (princ "Installation methods:\n")
      (princ "1. M-x package-install RET aider RET\n")
      (princ "2. (use-package aider :ensure t)\n\n")
      (princ "Prerequisites:\n")
      (princ "- Install aider CLI: pipx install aider-chat\n")
      (princ "- Set up API keys for your preferred AI model\n\n")
      (princ "Usage:\n")
      (princ "- C-c a m  Open main Aider menu\n")
      (princ "- C-c a s  Start Aider session\n")
      (princ "- C-c a +  Add files to context\n")
      (princ "- C-c a c  Request code changes\n")
      (princ "- C-c a q  Ask questions\n"))))


;;; ------------------------------------------------------------------------
;;; --- Copilot guards for big/temp buffers ---
(defun vutr/copilot-too-large-or-temp-p ()
  (or (> (buffer-size) 200000)
      (string-match-p "\\`\\*temp\\*" (buffer-name))
      (minibufferp)))

(with-eval-after-load 'copilot
  (setq copilot-max-char 300000)  ;; optional; or remove if you prefer strict cutoff
  (add-to-list 'copilot-disable-predicates #'vutr/copilot-too-large-or-temp-p))


;;; ------------------------------------------------------------------------
;;; Dedicated keybinding section (conflict-free, using C-c a prefix)
;;; ------------------------------------------------------------------------
(define-prefix-command 'vutr-ai-map)
(global-set-key (kbd "C-c a") 'vutr-ai-map)

;; Copilot: quick toggle under AI prefix (C-c a t)
(define-key vutr-ai-map (kbd "t") #'vutr/copilot-toggle)

;; Copilot Chat under AI prefix
(define-key vutr-ai-map (kbd "C") #'copilot-chat-display) ; C-c a C  open/raise
(define-key vutr-ai-map (kbd "e") #'copilot-chat-explain) ; C-c a e  explain region/buffer
(define-key vutr-ai-map (kbd "f") #'copilot-chat-fix)     ; C-c a f  propose fix
(define-key vutr-ai-map (kbd "r") #'copilot-chat-review)  ; C-c a r  quick review
(define-key vutr-ai-map (kbd "o") #'copilot-chat-open)    ; C-c a o  discuss current file
(define-key vutr-ai-map (kbd "x") #'copilot-chat-reset)   ; C-c a x  reset session

;; Aider under AI prefix
(define-key vutr-ai-map (kbd "s") #'aider-start)                      ; C-c a s  start aider
(define-key vutr-ai-map (kbd "S") #'vutr/aider-start-with-current-file) ; C-c a S  start + add file
(define-key vutr-ai-map (kbd "m") #'aider-send-message)               ; C-c a m  send message
(define-key vutr-ai-map (kbd "+") #'aider-add-file)                   ; C-c a +  add file
(define-key vutr-ai-map (kbd "-") #'aider-remove-file)                ; C-c a -  remove file
(define-key vutr-ai-map (kbd "C") #'aider-commit)                     ; C-c a C  commit changes
(define-key vutr-ai-map (kbd "u") #'aider-undo)                       ; C-c a u  undo last
(define-key vutr-ai-map (kbd "R") #'aider-clear)                      ; C-c a R  reset/clear
(define-key vutr-ai-map (kbd "X") #'aider-exit)                       ; C-c a X  exit aider
(define-key vutr-ai-map (kbd "d") #'vutr/aider-diagnose)              ; C-c a d  diagnostic
(define-key vutr-ai-map (kbd "i") #'vutr/aider-install-instructions)  ; C-c a i  install help

(provide 'vutr-ai)
;;; vutr-ai.el ends here
