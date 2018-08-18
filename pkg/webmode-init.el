(require 'web-mode)
(require 'emmet-mode)

;;; Code:
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

(defun my-web-mode-hook ()
  "Code format and js hook."
  (setq-local web-mode-markup-indent-offset 2)
  (setq-local web-mode-code-indent-offset 2)
  (setq-local web-mode-css-indent-offset 2)
  (setq-local web-mode-enable-auto-pairing t)
  (setq-local web-mode-enable-css-colorization t)
  (setq-local web-mode-enable-current-element-highlight t))

(add-hook 'web-mode-hook #'my-web-mode-hook)

;; Emmet tweak
(setq emmet-expand-jsx-className? t)
(setq emmet-self-closing-tag-style " /")
(setq emmet-move-cursor-between-quotes t)

(global-set-key (kbd "C-q") 'emmet-expand-yas)

(provide 'webmode-init)
;;; webmode-init.el ends here
