;;; vutr-report.el --- Build dashboard items and block renderers -*- lexical-binding: t; -*-

;;; Commentary:
;; Provides functionality to build dashboard items and single-block renderers
;; for feature reporting and module loading diagnostics.

;;; Code:

(require 'cl-lib)
(require 'subr-x)

(defun vutr-report--feature-file (feature)
  "Return FILE that provided FEATURE, or nil if unknown.
Handles both (provide FEATURE) and (provide . FEATURE) entries in `load-history`."
  (cl-loop for (file . forms) in load-history
           thereis
           (when (cl-some
                  (lambda (f)
                    (and (consp f)
                         (eq (car f) 'provide)
                         (let* ((tail (cdr f))
                                (sym  (if (consp tail) (car tail) tail)))
                           (eq sym feature))))
                  forms)
             file)))

(defun vutr-report--item (feature)
  "Return a block-item plist for FEATURE (no rendering).

Item shape for `dashboard/body-table`:
  (:icon STRING :title STRING :desc STRING :action FN)

Loads FEATURE if needed, times it, and sets a sensible :action."
  (let* ((already (featurep feature))
         (t0 (current-time))
         status ms err file)
    (condition-case e
        (progn
          (unless already (require feature))
          (setq ms (float-time (time-subtract (current-time) t0))
                status 'ok))
      (error
       (setq ms (float-time (time-subtract (current-time) t0))
             status 'failed
             err (error-message-string e))))
    (setq file (vutr-report--feature-file feature))
    (let* ((ok    (eq status 'ok))
           (title (symbol-name feature))
           (desc  (cond
                   ((and ok already) (format "cached  %s" (or file "")))
                   (ok               (format "%.1f ms  %s" (* 1000.0 (or ms 0.0)) (or file "")))
                   (t                (format "FAILED (%.1f ms): %s"
                                             (* 1000.0 (or ms 0.0))
                                             (or err "unknown error"))))))
      (list :icon  (if ok "✔" "✖")
            :title title
            :desc  desc
            :action (cond
                     ((and ok file (file-exists-p file)) (lambda () (find-file file)))
                     (err (lambda () (message "%s" err)))
                     (t   (lambda () (message "No action for %s" title))))))))

;;;###autoload
(defun vutr-report/modules (features)
  "Return a LIST of block items for FEATURES (list of symbols).
This does NOT render anything—perfect for composing with other items later."
  (unless (listp features)
    (user-error "vutr-report/modules expects a list of feature symbols"))
  (mapcar #'vutr-report--item features))

;;;###autoload
(defun vutr-report/block (feature)
  "Return a RENDERER (thunk) that draws a one-row table for FEATURE.
Convenience wrapper around `dashboard/body-table` using `vutr-report--item`."
  (require 'dashboard/block) ;; load renderer only when needed
  (let ((item (vutr-report--item feature)))
    (dashboard/body-table (list item))))

(provide 'vutr-report)
;;; vutr-report.el ends here
