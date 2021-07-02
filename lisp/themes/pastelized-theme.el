;;; pastelized-theme.el --- pastelized
;;; Version: 1.0
;;; Commentary:
;;; A theme called pastelized
;;; Code:

(deftheme pastelized "DOCSTRING for pastelized")
(custom-theme-set-faces
 'pastelized
 '(default ((t (:foreground "#435780" :background "#f4f0eb" ))))
 '(cursor ((t (:background "#ff6d73" ))))
 '(fringe ((t (:background "#f2f1ed" ))))
 '(mode-line ((t (:foreground "#474747" :background "#eebca1" ))))
 '(region ((t (:background "#e6ddf2" ))))
 '(secondary-selection ((t (:background "#d2d2d2" ))))
 '(font-lock-builtin-face ((t (:foreground "#f09a7d" ))))
 '(font-lock-comment-face ((t (:foreground "#bdbdbd" ))))
 '(font-lock-function-name-face ((t (:foreground "#ec3c00" ))))
 '(font-lock-keyword-face ((t (:foreground "#ca5c37" ))))
 '(font-lock-string-face ((t (:foreground "#328cb4" ))))
 '(font-lock-type-face ((t (:foreground "#008187" ))))
 '(font-lock-constant-face ((t (:foreground "#d96887" ))))
 '(font-lock-variable-name-face ((t (:foreground "#219f84" ))))
 '(minibuffer-prompt ((t (:foreground "#dd7421" :bold t ))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
 '(line-number ((t (:foreground "#dddddd" ))))
 '(line-number-current-line ((t (:foreground "#ec3c00" ))))
 '(web-mode-html-tag-face ((t (:foreground "#219f84" ))))
 )

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'pastelized)

;;; pastelized-theme.el ends here
