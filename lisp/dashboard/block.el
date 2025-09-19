;;; dashboard/block.el --- Body table component -*- lexical-binding: t; -*-

(require 'cl-lib)
(require 'subr-x)
(require 'button)

(defgroup dashboard/block nil
  "Body list/table component."
  :group 'convenience)

(defface dashboard/block-title
  '((t :weight semi-bold))
  "Face for item title.")

(defface dashboard/block-desc
  '((t :inherit shadow))
  "Face for item description.")

(defface dashboard/block-icon
  '((t :inherit success))
  "Face for icon mark.")

;; Item shape: plist with keys
;;   :icon (string) e.g. \"✔\" or \"✖\"
;;   :title (string)
;;   :desc  (string)
;;   :action (fn)  ;; interactive lambda, no args
;; You can also pass a cons (TITLE . ACTION) and we’ll adapt.
(defun dashboard/block--normalize-item (item)
  (cond
   ((plistp item) item)
   ((and (consp item) (stringp (car item)) (functionp (cdr item)))
    (list :icon "•" :title (car item) :desc "" :action (cdr item)))
   (t (error "Invalid item: %S" item))))

(defun dashboard/block--row (item &optional width)
  (let* ((icon (or (plist-get item :icon) "•"))
         (title (or (plist-get item :title) ""))
         (desc (or (plist-get item :desc) ""))
         (act (plist-get item :action))
         (w (or width (window-body-width)))
         (icon-w 2)
         (gap 2)
         (title-w (max 18 (min 40 (- w icon-w gap 10))))
         (desc-w (max 10 (- w icon-w gap title-w 4))))
    ;; icon
    (insert (propertize (truncate-string-to-width icon icon-w 0 ?\s)
                        'face 'dashboard/block-icon))
    (insert (make-string gap ?\s))
    ;; title as button
    (let ((start (point)))
      (insert (truncate-string-to-width title title-w 0 ?…))
      (when act
        (make-text-button start (point)
                          'help-echo "Activate"
                          'follow-link t
                          'action (lambda (_btn) (funcall act)))))
    ;; gap
    (insert "  ")
    ;; desc
    (insert (propertize
             (truncate-string-to-width desc desc-w 0 ?…)
             'face 'dashboard/block-desc))
    (insert "\n")))

;;; API:
;;; (dashboard/body-table ITEMS) => render thunk.
;;; ITEMS: list of plists (:icon :title :desc :action)
;;;###autoload
(defun dashboard/body-table (items)
  (let* ((norm (mapcar #'dashboard/block--normalize-item items)))
    (lambda ()
      (let ((inhibit-read-only t))
        (dolist (it norm)
          (dashboard/block--row it))))))

(provide 'dashboard/block)
;;; dashboard/block.el ends here
