;;; dashboard/header.el --- Header component -*- lexical-binding: t; -*-

(require 'cl-lib)
(require 'subr-x)

(defgroup dashboard/header nil
  "Header component for dashboard."
  :group 'convenience)

(defface dashboard/header-title
  '((t :height 1.4 :weight bold))
  "Base face for title text.")

(defface dashboard/header-subtitle
  '((t :inherit shadow))
  "Base face for subtitle text.")

(defface dashboard/header-ghost
  '((t :inherit shadow :slant italic))
  "Face for ghost subtitle text.")

(defun dashboard/header--face-with-color (base color)
  (if (and (stringp color) (not (string-empty-p color)))
      (list base :foreground color)
    base))

;;; API:
;;; (dashboard/header :banner "/path/logo.png"
;;;                   :title  '(:text "My Dashboard" :color "#c6e48b")
;;;                   :subtitle '(:text "Loaded modules" :color "#999" :ghost t))
;;; Returns a render thunk.
;;;###autoload
(defun dashboard/header (&rest plist)
  (let* ((banner   (plist-get plist :banner))
         (title    (or (plist-get plist :title) '(:text "")))
         (subtitle (or (plist-get plist :subtitle) '(:text "")))
         (t-text   (plist-get title :text))
         (t-color  (plist-get title :color))
         (s-text   (plist-get subtitle :text))
         (s-color  (plist-get subtitle :color))
         (s-ghost  (plist-get subtitle :ghost)))
    (lambda ()
      (let ((inhibit-read-only t))
        (when (and banner (file-exists-p banner))
          (let ((img (create-image banner)))
            (when img
              (insert-image img)
              (insert "\n"))))
        (when (and t-text (not (string-empty-p t-text)))
          (insert (propertize t-text
                              'face (dashboard/header--face-with-color
                                     'dashboard/header-title t-color))
                  "\n"))
        (when (and s-text (not (string-empty-p s-text)))
          (insert (propertize s-text
                              'face (dashboard/header--face-with-color
                                     (if s-ghost 'dashboard/header-ghost 'dashboard/header-subtitle)
                                     s-color))
                  "\n"))
        (insert "\n")))))

(provide 'dashboard/header)
;;; dashboard/header.el ends here
