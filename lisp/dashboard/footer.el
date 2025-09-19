;;; dashboard/footer.el --- Footer component -*- lexical-binding: t; -*-

(require 'subr-x)
(require 'browse-url)

(defgroup dashboard/footer nil
  "Footer component."
  :group 'convenience)

(defface dashboard/footer-dim
  '((t :inherit shadow))
  "Dim face for footer text.")

(defun dashboard/footer--button (label url)
  (let ((start (point)))
    (insert label)
    (make-text-button start (point)
                      'help-echo url
                      'follow-link t
                      'action (lambda (_btn) (browse-url url)))))

;;; API:
;;; (dashboard/footer :author "Vu Tran"
;;;                   :repo "https://github.com/user/repo"
;;;                   :extra \"Some text\")
;;;###autoload
(defun dashboard/footer (&rest plist)
  (let* ((author (plist-get plist :author))
         (repo   (plist-get plist :repo))
         (extra  (plist-get plist :extra)))
    (lambda ()
      (let ((inhibit-read-only t))
        (insert "\n")
        (insert (propertize
                 (format "Time: %s   Init: %s"
                         (format-time-string "%Y-%m-%d %H:%M:%S")
                         (if (fboundp 'emacs-init-time) (emacs-init-time) "N/A"))
                 'face 'dashboard/footer-dim))
        (insert "\n")
        (when author
          (insert (propertize "Author: " 'face 'dashboard/footer-dim))
          (insert author "   "))
        (when repo
          (insert (propertize "Repo: " 'face 'dashboard/footer-dim))
          (dashboard/footer--button repo repo))
        (when (and extra (not (string-empty-p extra)))
          (insert "\n" (propertize extra 'face 'dashboard/footer-dim)))
        (insert "\n")))))

(provide 'dashboard/footer)
;;; dashboard/footer.el ends here
