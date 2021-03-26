;;; package --- Summary:
;;; Commentary:
;;; my own key-bindings
;;; Code:

(global-set-key (kbd "M-m") 'execute-extended-command)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-c m") 'projectile-vc)

(global-set-key (kbd "C-c p p") 'projectile-switch-project)
(global-set-key (kbd "C-;" ) 'projectile-find-file)
(global-set-key (kbd "C-c p s" ) 'ag-project)
(global-set-key (kbd "C-c C-e") 'wgrep-change-to-wgrep-mode)

(global-set-key (kbd "C-t") 'frog-jump-buffer)
(global-set-key (kbd "C-c r") 'recentf-open-files)

(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "C-]") 'er/expand-region)

(global-set-key (kbd "C-c i e") 'iedit-mode)
(global-set-key (kbd "C-c i r") 'iedit-restrict-function)

(global-set-key (kbd "C-l") 'smart-kill-whole-line)

(global-set-key (kbd "C-c d") 'docker)

(global-set-key (kbd "RET") 'my-fancy-newline)
(global-set-key (kbd "M-z") 'zop-to-char)

(global-set-key (kbd "C-c s r") 'sp-rewrap-sexp)
(global-set-key (kbd "C-c s u") 'sp-unwrap-sexp)
(global-set-key (kbd "C-c s t") 'smartparens-strict-mode)

(global-set-key (kbd "C-c q") 'emmet-expand-yas)

(provide 'keybindings)
;;; keybindings ends here
