;; Unset keys
(global-unset-key (kbd "C-x k"))
(global-unset-key (kbd "M-;"))


;; Fundamental
(global-set-key (kbd "RET") 'my-fancy-newline)
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
(global-set-key (kbd "M-;") 'comment-line)

(global-set-key (kbd "C-c h") 'recenter)

(global-set-key (kbd "C-c b") 'switch-to-previous-buffer)
(global-set-key (kbd "C-c n") 'lunaryorn-new-buffer-frame)


;; Counsel
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-m") 'counsel-M-x)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c r") 'counsel-recentf)
(global-set-key (kbd "C-c t") 'counsel-load-theme)
(global-set-key (kbd "C-c p p") 'counsel-projectile-switch-project)
(global-set-key (kbd "C-c p s") 'projectile-ag)
(global-set-key (kbd "M-j") 'ivy-yank-word)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-;") 'counsel-projectile-find-file)


;; Keychord
(key-chord-define-global "km" 'volatile-kill-buffer)
(key-chord-define-global "KM" 'magit-branch-and-checkout)
(key-chord-define-global "KO" 'magit-file-checkout)


;; Smartparens
(global-set-key (kbd "C->") 'sp-slurp-hybrid-sexp)
(global-set-key (kbd "C-r") 'sp-rewrap-sexp)
(global-set-key (kbd "C-u") 'sp-unwrap-sexp)
(global-set-key (kbd "C-c C-.") 'sp-slurp-hybrid-sexp)


;; Expand region
(global-set-key (kbd "C-]") 'er/expand-region)


;; Yasnippet
;; Using tab to expand snippet by default
;; (global-set-key (kbd "<TAB>") 'yas-expand-snippet)


;; Webmode
(global-set-key (kbd "C-q") 'emmet-expand-yas)
