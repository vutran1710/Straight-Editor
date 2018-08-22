;;; package --- summary
(use-package counsel
  :ensure t
  :init (use-package ivy :ensure t) (use-package swiper :ensure t)
  :config
  (ivy-mode 1)
  (counsel-projectile-mode)

  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t
        ivy-initial-inputs-alist nil)

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
  (define-key ivy-minibuffer-map (kbd "C-v") 'ivy-backward-delete-char)
  (define-key ivy-minibuffer-map (kbd "C-d") 'ivy-delete-char))

(provide 'counsel-init)
;;; counsel-init ends here
