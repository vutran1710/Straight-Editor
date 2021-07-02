;;; dimmer-theme.el --- dimmer
;;; Version: 1.0
;;; Commentary:
;;; A theme called dimmer
;;; Code:

(deftheme dimmer "DOCSTRING for dimmer")
(custom-theme-set-faces
 'dimmer
 '(default ((t (:foreground "#adc995" :background "#293343" ))))
 '(cursor ((t (:background "#00a5ee" ))))
 '(fringe ((t (:background "#293343" ))))
 '(mode-line ((t (:foreground "#000000" :background "#778069" ))))
 '(region ((t (:background "#445d60" ))))
 '(secondary-selection ((t (:background "#3e3834" ))))
 '(font-lock-builtin-face ((t (:foreground "#4cc36a" ))))
 '(font-lock-comment-face ((t (:foreground "#697a9c" ))))
 '(font-lock-function-name-face ((t (:foreground "#94a54e" ))))
 '(font-lock-keyword-face ((t (:foreground "#63bba4" ))))
 '(font-lock-string-face ((t (:foreground "#4993b4" ))))
 '(font-lock-type-face ((t (:foreground "#87c321" ))))
 '(font-lock-constant-face ((t (:foreground "#ff9374" ))))
 '(font-lock-variable-name-face ((t (:foreground "#e35d5d" ))))
 '(minibuffer-prompt ((t (:foreground "#b8b8b6" :bold t ))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
 '(line-number ((t (:foreground "#3f4c65" ))))
 '(line-number-current-line ((t (:foreground "#ff9374" ))))
 '(web-mode-html-tag-face ((t (:foreground "#87c321" ))))
 )

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'dimmer)

;;; dimmer-theme.el ends here
