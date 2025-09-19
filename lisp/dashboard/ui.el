;;; dashboard/ui.el --- Layout-only UI compositor -*- lexical-binding: t; -*-

(require 'cl-lib)
(require 'subr-x)
(require 'button)

(defgroup dashboard/ui nil
  "Layout-only compositor for a dashboard buffer."
  :group 'convenience)

(defface dashboard/ui-sep
  '((t :inherit shadow))
  "Face for section separators.")

(defvar-local dashboard/ui--renderers nil
  "Buffer-local list of render thunks for refresh.")

(define-derived-mode dashboard/ui-mode special-mode "Dashboard"
  "Read-only dashboard buffer."
  (setq buffer-read-only t
        truncate-lines t)
  (use-local-map (copy-keymap special-mode-map))
  (let ((map (current-local-map)))
    (define-key map (kbd "g") #'dashboard/ui-refresh)
    (define-key map (kbd "q") #'quit-window)))

(defun dashboard/ui--sep (&optional label)
  (let* ((w (max 60 (window-body-width)))
         (line (make-string w ?-)))
    (insert (propertize line 'face 'dashboard/ui-sep) "\n")
    (when label
      (insert (propertize (format " %s\n" label) 'face 'dashboard/ui-sep)))))

(defun dashboard/ui-refresh ()
  "Re-render the dashboard from stored renderers."
  (interactive)
  (unless dashboard/ui--renderers
    (user-error "No renderers stored in this buffer"))
  (let ((inhibit-read-only t))
    (erase-buffer)
    (dolist (r dashboard/ui--renderers)
      (pcase r
        (`(:sep ,label) (dashboard/ui--sep label))
        (_ (funcall r))))
    (goto-char (point-min))))

;;;###autoload
(defun dashboard/make-dashboard (header-renderer blocks footer-renderer
                                                 &optional buffer-name)
  "Compose HEADER-RENDERER, BLOCKS (list of render thunks), and FOOTER-RENDERER.
Each renderer is a thunk (no args) that inserts into current buffer.
Return the buffer and display it."
  (let* ((buf (get-buffer-create (or buffer-name "*Dashboard*"))))
    (with-current-buffer buf
      (dashboard/ui-mode)
      (setq-local dashboard/ui--renderers
                  (append
                   (list header-renderer '(:sep ""))
                   (cl-mapcan (lambda (b) (list b '(:sep ""))) blocks)
                   (list footer-renderer)))
      (dashboard/ui-refresh))
    (pop-to-buffer buf)
    buf))

(provide 'dashboard/ui)
;;; dashboard/ui.el ends here
