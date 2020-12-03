(global-set-key (kbd "M-m") 'execute-extended-command)
(global-set-key (kbd "C-c m") 'projectile-vc)
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
(global-set-key (kbd "C-;" ) 'projectile-find-file)

(global-set-key (kbd "C-t") 'frog-jump-buffer)
(global-set-key (kbd "C-c r") 'recentf-open-files)

(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "C-]") 'er/expand-region)

(provide 'keybindings)
