;;; package --- Summary:
;;; Commentary:
;;; my own key-bindings
;;; Code:

(global-set-key (kbd "C-s") 'consult-line)
(global-set-key (kbd "C-c M-s") 'consult-ripgrep)
(global-set-key (kbd "M-g M-g") 'consult-goto-line)
(global-set-key (kbd "C-c C-o") 'consult-outline)
(global-set-key (kbd "M-y") 'consult-yank-from-kill-ring)

(global-set-key (kbd "C-c n") 'duplicate-line-or-region)
(global-set-key (kbd "C-c k") 'copy-line)

(global-set-key (kbd "<f8>") 'cycle-themes)

(global-set-key (kbd "M-m") 'execute-extended-command)
(global-set-key (kbd "C-c m") 'projectile-vc)

(global-set-key (kbd "C-c p p") 'projectile-switch-project)

(global-set-key (kbd "C-;" ) 'projectile-find-file)
(global-set-key (kbd "C-c p s" ) 'rg-menu)
(global-set-key (kbd "C-c C-e") 'wgrep-change-to-wgrep-mode)

(global-set-key (kbd "C-t") 'frog-jump-buffer)
(global-set-key (kbd "C-c r") 'recentf-open-files)

(global-set-key (kbd "C-v") 'avy-goto-char-in-line)
(global-set-key (kbd "C-c 1") 'avy-goto-char)
(global-set-key (kbd "C-c 2") 'avy-goto-char-2)

(global-set-key (kbd "C-]") 'er/expand-region)

(global-set-key (kbd "C-c i i") 'iedit-mode)

(global-set-key (kbd "C-l") 'smart-kill-whole-line)

(global-set-key (kbd "C-c d") 'docker)

(global-set-key (kbd "RET") 'my-fancy-newline)
(global-set-key (kbd "M-z") 'zop-up-to-char)
(global-set-key (kbd "M-Z") 'zop-to-char)
(global-set-key (kbd "C-c h") 'recenter)

(global-set-key (kbd "C-c s r") 'sp-rewrap-sexp)
(global-set-key (kbd "C-c s u") 'sp-unwrap-sexp)
(global-set-key (kbd "C-c s j") 'sp-slurp-hybrid-sexp)
(global-set-key (kbd "C-c s e") 'sp-end-of-sexp)
(global-set-key (kbd "C-c s a") 'sp-beginning-of-sexp)
(global-set-key (kbd "C-c s k") 'sp-kill-sexp)
(global-set-key (kbd "C-c s t") 'smartparens-strict-mode)

(global-set-key (kbd "M-u") #'fix-word-upcase)
(global-set-key (kbd "M-l") #'fix-word-downcase)
(global-set-key (kbd "M-c") #'fix-word-capitalize)

(global-set-key (kbd "C-c q") 'emmet-expand-yas)

(global-set-key (kbd "C-c b") 'instant-switch-to-previous-buffer)

(global-set-key (kbd "C-a") 'smarter-move-beginning-of-line)

(provide 'keybindings)
;;; keybindings ends here
