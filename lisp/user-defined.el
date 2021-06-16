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

(defun shell-command-on-buffer (command)
  "Running shell-command on the whole buffer, eg: $ python main.py."
  (interactive "sShell command on buffer: ")
  (shell-command-on-region
   (point-min)
   (point-max)
   command
   nil))

(provide 'user-defined)
;;; user-defined ends here
