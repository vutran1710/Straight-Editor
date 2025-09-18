;;; package --- Summary:
;;; Commentary:
;;; hello
;;; Code:

(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))

(defadvice dired-readin
    (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding mark."
  (mydired-sort))

(defun my-fancy-newline ()
  "Add two newlines and put the cursor at the right indentation."
  (interactive)
  (if (or
       (and (equal (char-before) 123) ; {}
            (equal (char-after) 125))
       (and (equal (char-before) 40) ; ()
            (equal (char-after) 41))
       (and (equal (char-before) 91) ; []
            (equal (char-after) 93)))
      (progn (newline-and-indent)
             (split-line)
             (indent-for-tab-command))
    (newline-and-indent)))

(defun smart-kill-whole-line (&optional arg)
  "Kill-whole-line that respects indentation."
  (interactive "P")
  (kill-whole-line arg)
  (back-to-indentation))

(defun instant-switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(defun duplicate-line-or-region (&optional n)
  "Duplicate current line, or region if active.
With argument N, make N copies.
With negative N, comment out original line and use the absolute value."
  (interactive "*p")
  (let ((use-region (use-region-p)))
    (save-excursion
      (let ((text (if use-region
                      (buffer-substring (region-beginning) (region-end))
                    (prog1 (thing-at-point 'line)
                      (end-of-line)
                      (if (< 0 (forward-line 1))
                          (newline))))))
        (dotimes (i (abs (or n 1)))
          (insert text))))
    (if use-region nil
      (let ((pos (- (point) (line-beginning-position))))
        (if (> 0 n)
            (comment-region (line-beginning-position) (line-end-position)))
        (forward-line 1)
        (forward-char pos)))))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line."
  (interactive "^p")
  (setq arg (or arg 1))
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
  (interactive "p")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (when mark-active
      (if (> (point) (mark))
          (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
        (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
    (if (eq last-command 'copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-ring-save beg end)))
  (kill-append "\n" nil)
  (beginning-of-line (or (and arg (1+ arg)) 2))
  (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

;; Convenience prefix alongside the stock C-x p
(with-eval-after-load 'project
  (define-key global-map (kbd "C-c p") project-prefix-map)

  ;; Use Consult for project search & buffers
  (define-key project-prefix-map (kbd "s") #'consult-ripgrep)        ;; search in project root
  (define-key project-prefix-map (kbd "B") #'consult-project-buffer) ;; buffers scoped to project

  ;; (Optional) nicer “switch project” menu (Emacs 29+)
  (when (boundp 'project-switch-commands)
    (setq project-switch-commands
          '((?f "Find file"         project-find-file)
            (?s "Ripgrep (Consult)" consult-ripgrep)
            (?b "Switch buffer"     project-switch-to-buffer)
            (?! "Shell"             project-shell)
            (?g "Magit status"      magit-status)))))

(defun my/project-root ()
  "Return current project root or nil."
  (when-let ((proj (project-current)))
    (project-root proj)))

(defun my/project-vc ()
  "Open VCS UI at project root. Prefer Magit if available."
  (interactive)
  (let ((dir (or (my/project-root) default-directory)))
    (cond
     ((fboundp 'magit-status) (magit-status dir))
     ((fboundp 'project-vc-dir) (project-vc-dir)) ; Emacs builtin VC-Dir at project root
     (t (vc-dir dir)))))


(provide 'user-defined)
;;; user-defined ends here
