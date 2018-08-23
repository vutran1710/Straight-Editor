(use-package web-mode
  :ensure t
  :init
  (use-package emmet-mode
    :ensure t
    :config (setq emmet-expand-jsx-className? t
                  emmet-self-closing-tag-style " /"
                  emmet-move-cursor-between-quotes t))
  (use-package flycheck :ensure t)
  :config
  (global-flycheck-mode 1)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html.eex\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
  (setq web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-current-element-highlight t)
  (global-set-key (kbd "C-q") 'emmet-expand-yas))


(provide 'webmode-init)
;;; webmode-init.el ends here
