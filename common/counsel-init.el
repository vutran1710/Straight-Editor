(use-package counsel
  :ensure t
  :init
  (use-package ivy :ensure t)
  (use-package swiper :ensure t)
  (use-package counsel-projectile :ensure t)
  (use-package smex
    :ensure t
    :hook (after-init . smex-initialize))

  :config
  (ivy-mode 1)
  (counsel-projectile-mode)

  (setq ivy-use-virtual-buffers t
        enable-recursive-minibuffers t
        ivy-initial-inputs-alist nil)

  (define-key ivy-minibuffer-map (kbd "M-v") 'ivy-backward-kill-word)
  (define-key ivy-minibuffer-map (kbd "M-d") 'ivy-kill-word)
  (define-key ivy-minibuffer-map (kbd "C-v") 'ivy-backward-delete-char)
  (define-key ivy-minibuffer-map (kbd "C-d") 'ivy-delete-char))

(provide 'counsel-init)
