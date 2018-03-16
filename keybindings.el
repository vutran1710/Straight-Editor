;; Set keys
(global-set-key (kbd "<f4>") 'split-window-horizontally)
(global-set-key (kbd "<f5>") 'split-window-vertically)
(global-set-key (kbd "<f6>") 'package-install)
(global-set-key (kbd "<f9>") 'eval-buffer)

(global-set-key (kbd "C-c C-k") 'copy-line)
(global-set-key (kbd "C-l") 'kill-whole-line)

(global-set-key (kbd "C-v") 'delete-backward-char)

(global-set-key (kbd "M-n") 'forward-paragraph)
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-v") 'backward-kill-word)

(global-set-key (kbd "C-c h") 'recenter)

(global-set-key (kbd "C-c b") 'switch-to-previous-buffer)


;; Unset keys
(global-unset-key (kbd "C-x k"))
