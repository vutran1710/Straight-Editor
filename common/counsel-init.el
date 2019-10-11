(use-package ivy
  :ensure t
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (define-key ivy-minibuffer-map (kbd "M-v") 'ivy-backward-kill-word)
  (define-key ivy-minibuffer-map (kbd "M-d") 'ivy-kill-word)
  (define-key ivy-minibuffer-map (kbd "C-v") 'ivy-backward-delete-char)
  (define-key ivy-minibuffer-map (kbd "C-d") 'ivy-delete-char))

(use-package swiper :ensure t)

(use-package counsel-projectile
  :ensure t)

(use-package counsel
  :ensure t
  :init
  :config
  (counsel-projectile-mode)
  (setq ivy-initial-inputs-alist nil))

(provide 'counsel-init)
