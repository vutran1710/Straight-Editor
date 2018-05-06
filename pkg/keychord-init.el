(require 'key-chord)

;; Max time delay between two key presses to be considered a key chord
(setq key-chord-two-keys-delay 0.1) ; default 0.1

;; Max time delay between two presses of the same key to be considered a key chord.
;; Should normally be a little longer than `key-chord-two-keys-delay'.
(setq key-chord-one-key-delay 0.2) ; default 0.2

(key-chord-define-global "kk" 'volatile-kill-buffer)
(key-chord-define-global "km" 'my-fancy-newline)

(key-chord-mode 1)
