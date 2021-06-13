;;; package --- Summary:
;;; Commentary:
;;; my own key-bindings
;;; Code:

(global-set-key (kbd "M-m") 'execute-extended-command)
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "C-c m") 'projectile-vc)

(global-set-key (kbd "C-c p p") 'projectile-switch-project)

(global-set-key (kbd "C-;" ) 'projectile-find-file)
(global-set-key (kbd "C-c p s" ) 'ag-project)
(global-set-key (kbd "C-c C-e") 'wgrep-change-to-wgrep-mode)

(global-set-key (kbd "C-t") 'frog-jump-buffer)
(global-set-key (kbd "C-c r") 'recentf-open-files)

(global-set-key (kbd "C-c a j") 'avy-goto-char)
(global-set-key (kbd "C-c a k") 'avy-goto-char-2)
(global-set-key (kbd "C-c a l") 'avy-goto-line)

(global-set-key (kbd "C-]") 'er/expand-region)

(global-set-key (kbd "C-c i e") 'iedit-mode)
(global-set-key (kbd "C-c i r") 'iedit-restrict-function)

(global-set-key (kbd "C-l") 'smart-kill-whole-line)

(global-set-key (kbd "C-c d") 'docker)

(global-set-key (kbd "RET") 'my-fancy-newline)
(global-set-key (kbd "M-z") 'zap-up-to-char)
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

(provide 'keybindings)
;;; keybindings ends here
