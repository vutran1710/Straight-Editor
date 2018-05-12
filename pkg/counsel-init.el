(require 'ivy)
(require 'counsel)
(require 'swiper)

(ivy-mode 1)
(counsel-projectile-mode)

(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-initial-inputs-alist nil)

(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "M-m") 'counsel-M-x)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "C-c r") 'counsel-recentf)
(global-set-key (kbd "C-c t") 'counsel-load-theme)

(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c k") 'counsel-ag)
(global-set-key (kbd "C-;") 'counsel-projectile-find-file)

(define-key ivy-minibuffer-map (kbd "M-v") 'ivy-backward-kill-word)
(define-key ivy-minibuffer-map (kbd "M-d") 'ivy-kill-word)
