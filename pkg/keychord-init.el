(use-package key-chord
  :ensure t
  :config
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.1)
  (setq key-chord-one-key-delay 0.2)
  (key-chord-define-global "km" 'volatile-kill-buffer))
