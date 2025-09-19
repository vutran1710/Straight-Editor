;;; vutr-dashboard.el --- Dashboard with custom features widget -*- lexical-binding: t; -*-
;;; Commentary:
;; Provides a startup dashboard based on `emacs-dashboard` with
;; a custom widget to display loaded features and their load times.
;;
;; Place this file in ~/.emacs.d/lisp/ and add:
;;   (require 'vutr-dashboard)
;; to your init.el

;;; Code:

(require 'use-package)

;; ---------------------------------------------------------------------
;; Track feature load times
;; ---------------------------------------------------------------------

(defvar vutr/feature-times (make-hash-table :test #'equal)
  "Hash table mapping feature name (string) → load time (ms).")

(defvar vutr/feature-start-time (current-time)
  "Time when Emacs started loading, used to measure feature durations.")

(defun vutr/track-feature-load (feature _filename)
  "Record FEATURE load time into `vutr/feature-times`."
  (let ((elapsed (* 1000.0 (float-time (time-subtract (current-time)
                                                      vutr/feature-start-time)))))
    (puthash (symbol-name feature) elapsed vutr/feature-times)))

(add-hook 'after-load-functions #'vutr/track-feature-load)

;; ---------------------------------------------------------------------
;; Custom dashboard widget
;; ---------------------------------------------------------------------

(defun vutr/dashboard-widget-features (list-size)
  "Insert a dashboard section showing loaded features and their load times."
  (dashboard-insert-section
   "Loaded Features"
   ;; collect items sorted slowest → fastest
   (let (items)
     (maphash (lambda (feat ms)
                (push (cons feat ms) items))
              vutr/feature-times)
     (seq-take
      (sort items (lambda (a b) (> (cdr a) (cdr b)))) ;; slowest first
      list-size))
   ;; render each line
   (lambda (item)
     (let ((feat (car item))
           (ms   (cdr item)))
       (insert (format "%-35s %7.1f ms\n" feat ms))))))

;; ---------------------------------------------------------------------
;; Dashboard setup via use-package
;; ---------------------------------------------------------------------

(use-package dashboard
  :ensure t
  :config
  (setq dashboard-startup-banner 'official
        dashboard-center-content t
        dashboard-set-heading-icons t
        dashboard-set-file-icons t
        dashboard-items
        '((recents   . 5)
          (bookmarks . 5)
          (projects  . 5)
          (agenda    . 5)
          (registers . 5)
          (features  . 20))) ;; our custom widget

  (add-to-list 'dashboard-item-generators
               '(features . vutr/dashboard-widget-features))

  ;; Show dashboard at startup
  (dashboard-setup-startup-hook))

(provide 'vutr-dashboard)
;;; vutr-dashboard.el ends here
