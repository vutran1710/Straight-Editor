;;; vutr-treesit.el --- One-shot Tree-sitter installer & remapper -*- lexical-binding: t; -*-

(require 'treesit)

;; Known grammar sources (lang . (repo subdir?))
(defconst vutr/treesit-known-sources
  '((rust        . ("https://github.com/tree-sitter/tree-sitter-rust"))
    (c           . ("https://github.com/tree-sitter/tree-sitter-c"))
    (cpp         . ("https://github.com/tree-sitter/tree-sitter-cpp"))
    (python      . ("https://github.com/tree-sitter/tree-sitter-python"))
    (javascript  . ("https://github.com/tree-sitter/tree-sitter-javascript"))
    (json        . ("https://github.com/tree-sitter/tree-sitter-json"))
    (html        . ("https://github.com/tree-sitter/tree-sitter-html"))
    (css         . ("https://github.com/tree-sitter/tree-sitter-css"))
    (bash        . ("https://github.com/tree-sitter/tree-sitter-bash"))
    (go          . ("https://github.com/tree-sitter/tree-sitter-go"))
    (toml        . ("https://github.com/tree-sitter/tree-sitter-toml"))
    (yaml        . ("https://github.com/ikatyang/tree-sitter-yaml"))
    ;; Typescript grammars live as subdirs in the same repo:
    (typescript  . ("https://github.com/tree-sitter/tree-sitter-typescript" "typescript"))
    (tsx         . ("https://github.com/tree-sitter/tree-sitter-typescript" "tsx")))
  "Map of language symbols to their Tree-sitter grammar sources.")

;; Legacy major-mode -> ts-mode mapping.
(defconst vutr/treesit-mode-map
  '((rust        . (rust-mode        . rust-ts-mode))
    (c           . (c-mode           . c-ts-mode))
    (cpp         . (c++-mode         . c++-ts-mode))
    (python      . (python-mode      . python-ts-mode))
    (javascript  . (js-mode          . js-ts-mode))
    (json        . (json-mode        . json-ts-mode))
    (html        . (html-mode        . html-ts-mode))
    (css         . (css-mode         . css-ts-mode))
    (bash        . (sh-mode          . bash-ts-mode))   ;; Emacs 30 has bash-ts-mode
    (go          . (go-mode          . go-ts-mode))     ;; If not present, remap will be skipped
    (toml        . (toml-mode        . toml-ts-mode))   ;; idem
    (yaml        . (yaml-mode        . yaml-ts-mode))   ;; idem
    (typescript  . (typescript-mode  . typescript-ts-mode))
    (tsx         . (tsx-ts-mode      . tsx-ts-mode)))   ;; some setups use tsx-ts-mode directly
  "Mapping from language to (legacy-mode . ts-mode). Remap skipped if ts-mode is undefined.")

(defun vutr/treesit--ensure-source (lang)
  "Ensure LANG has an entry in `treesit-language-source-alist`, using known sources when possible."
  (let* ((entry (assq lang treesit-language-source-alist))
         (known (alist-get lang vutr/treesit-known-sources)))
    (when (and (null entry) known)
      (add-to-list 'treesit-language-source-alist
                   (cons lang known) t))
    (or (assq lang treesit-language-source-alist)
        (user-error "No grammar source configured for %s and not in known list" lang))))

(defun vutr/treesit--install (lang)
  "Install Tree-sitter grammar for LANG if missing."
  (unless (treesit-language-available-p lang)
    (message "Installing Tree-sitter grammar for %s..." lang)
    (condition-case err
        (progn
          (treesit-install-language-grammar lang)
          (message "Installed grammar for %s" lang))
      (error
       (user-error "Failed to install grammar for %s: %s" lang (error-message-string err))))))

(defun vutr/treesit--remap-mode (lang)
  "Remap legacy major mode to LANG's ts-mode, if available."
  (let* ((pair (alist-get lang vutr/treesit-mode-map))
         (legacy (car-safe pair))
         (tsmode (cdr-safe pair)))
    (cond
     ((and legacy tsmode (fboundp tsmode))
      (add-to-list 'major-mode-remap-alist (cons legacy tsmode))
      (message "Remapped %s -> %s" legacy tsmode))
     ;; Generic best-effort: derive ts-mode name like `LANG-ts-mode`
     ((and (null pair)
           (let* ((ts (intern (format "%s-ts-mode" (symbol-name lang)))))
             (when (fboundp ts)
               (add-to-list 'major-mode-remap-alist
                            (cons (intern (format "%s-mode" (symbol-name lang))) ts))
               (message "Remapped best-effort %s-mode -> %s" lang ts)
               t))))
     (t
      (message "No suitable ts-mode found for %s; remap skipped." lang)))))

;;;###autoload
(defun vutr/treesitter-install-lang (lang)
  "Interactively install Tree-sitter grammar for LANG and remap major mode.
LANG is a symbol (e.g., `rust`, `python`, `c`, `cpp`, `javascript`, `typescript`, `tsx`)."
  (interactive
   (list
    (intern
     (completing-read
      "Install grammar for language: "
      (delete-dups
       (append (mapcar #'car treesit-language-source-alist)
               (mapcar #'car vutr/treesit-known-sources)
               (mapcar #'car vutr/treesit-mode-map)))
      nil t))))
  ;; Ensure source, install if needed, then remap
  (vutr/treesit--ensure-source lang)
  (vutr/treesit--install lang)
  (vutr/treesit--remap-mode lang)
  (message "Done: %s ready." lang))

(provide 'vutr-treesit)
;;; vutr-treesit.el ends here
