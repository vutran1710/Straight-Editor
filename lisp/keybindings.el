;;; package --- Summary:
;;; Commentary:
;;; my own key-bindings
;;; Code:

(global-set-key (kbd "M-m") 'execute-extended-command)
(global-set-key (kbd "C-c m") 'projectile-vc)
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
(global-set-key (kbd "C-;" ) 'projectile-find-file)

(global-set-key (kbd "C-t") 'frog-jump-buffer)
(global-set-key (kbd "C-c r") 'recentf-open-files)

(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "C-]") 'er/expand-region)

(global-set-key (kbd "C-c a c") 'anzu-replace-at-cursor-thing)
(global-set-key (kbd "C-c a r") 'anzu-query-replace-regexp)
(global-set-key (kbd "C-c a i") 'anzu-isearch-query-replace)

(provide 'keybindings)
;;; keybindings ends here
