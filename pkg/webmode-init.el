(require 'web-mode)
(require 'emmet-mode)
(require 'tern)
(require 'company-tern)

;;; Code:
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))

(defun my-web-mode-hook ()
  "Code format and js hook."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t)
  (setq web-mode-enable-current-element-highlight t)
  (setq tern-mode t))

(add-hook 'web-mode-hook  'my-web-mode-hook)
(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; Emmet tweak
(setq emmet-expand-jsx-className? t)
(setq emmet-self-closing-tag-style " /")
(setq emmet-move-cursor-between-quotes t)

(global-set-key (kbd "C-q") 'emmet-expand-yas)

(defun delete-tern-process ()
  "Kill Tern when not auto-refresh."
  (interactive)
  (delete-process "Tern"))

(provide 'webmode-init)
;;; webmode-init.el ends here
