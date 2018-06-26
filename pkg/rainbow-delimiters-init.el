(require 'rainbow-delimiters)

(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
;;(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
