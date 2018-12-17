(use-package go-mode
  :ensure t
  :init
  (progn
    (setq gofmt-command "goimports")
    (bind-key [remap find-tag] #'godef-jump))
  :config
  (defun my-go-mode-hook ()
    (setq indent-tabs-mode 1)
    (setq tab-width 3)
    (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
    (setq gofmt-command "goimports")                ; gofmt uses invokes goimports
    (if (not (string-match "go" compile-command))   ; set compile command default
        (set (make-local-variable 'compile-command)
             "go build -v && go test -v && go vet"))

    ;; guru settings
    (go-guru-hl-identifier-mode)                    ; highlight identifiers

    ;; Key bindings specific to go-mode
    (local-set-key (kbd "M-.") 'godef-jump)         ; Go to definition
    (local-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
    (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
    (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
    (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
    (local-set-key (kbd "M-[") 'previous-error)     ; Go to previous error or msg

    ;; Misc go stuff
    (auto-complete-mode 1))                         ; Enable auto-complete mode

  ;; Connect go-mode-hook with the function we just defined
  (add-hook 'go-mode-hook 'my-go-mode-hook)

  ;; Ensure the go specific autocomplete is active in go-mode.
  (with-eval-after-load 'go-mode
    (require 'go-autocomplete)))


(use-package go-eldoc
  :ensure t
  :defer
  :init
  (add-hook 'go-mode-hook 'go-eldoc-setup))

(use-package go-autocomplete :ensure t)
