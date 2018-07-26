(deftheme ayu-apropospiate
  "Created 2018-07-26.")

(custom-theme-set-faces
 'ayu-apropospiate
 '(default ((t (:family "Fira Code" :foundry "nil" :width normal :height 120 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#546E7A" :background "#FAFAFA" :stipple nil :inherit nil))))
 '(cursor ((t (:inverse-video t :background "#EC407A"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:weight bold :foreground "#42A5F5"))))
 '(highlight ((t (:background "#f5dbf5dbf5db"))))
 '(region ((t (:background "#e67fe67fe67f"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((t (:background "#ffffffffffff"))))
 '(trailing-whitespace ((t (:foreground "#F57F17" :background "#f5dbf5dbf5db"))))
 '(font-lock-builtin-face ((t (:foreground "#0097A7"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#90A4AE"))))
 '(font-lock-comment-face ((t (:foreground "#90A4AE"))))
 '(font-lock-constant-face ((t (:foreground "#5C6BC0"))))
 '(font-lock-doc-face ((t (:foreground "#78909C"))))
 '(font-lock-function-name-face ((t (:foreground "#42A5F5"))))
 '(font-lock-keyword-face ((t (:foreground "#7E57C2"))))
 '(font-lock-negation-char-face ((t (:foreground "#FF1744"))))
 '(font-lock-preprocessor-face ((t (:foreground "#1E88E5"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#B388FF"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#B388FF"))))
 '(font-lock-string-face ((t (:foreground "#66BB6A"))))
 '(font-lock-type-face ((t (:foreground "#D84315"))))
 '(font-lock-variable-name-face ((t (:foreground "#26A69A"))))
 '(font-lock-warning-face ((t (:foreground "#D50000"))))
 '(button ((t (:inherit (link)))))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "#42A5F5"))))
 '(link-visited ((t (:foreground "#7E57C2" :inherit (link)))))
 '(fringe ((t (:foreground "#78909C" :background "#f5dbf5dbf5db"))))
 '(header-line ((t (:foreground "#7E57C2"))))
 '(tooltip ((t (:height 0.9 :foreground "#FAFAFA" :background "#546E7A"))))
 '(mode-line ((t (:background "#ffffffffffff" :foreground "#546E7A" :box (:line-width 1 :color "gray80") :height 1))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:slant italic :foreground "#78909C"))))
 '(mode-line-highlight ((t (:box nil :foreground "#78909C"))))
 '(mode-line-inactive ((t (:height 0.95 :box (:line-width 4 :color "#f5dbf5dbf5db" :style nil) :foreground "#78909C" :background "#f5dbf5dbf5db"))))
 '(isearch ((t (:inherit (match)))))
 '(isearch-fail ((t (:inherit (font-lock-warning-face)))))
 '(lazy-highlight ((t (:foreground "#F57F17"))))
 '(match ((t (:weight bold :foreground "#F57F17" :background "#f5dbf5dbf5db"))))
 '(next-error ((t (:background "#90A4AE"))))
 '(linum ((t (:foreground "gray80"))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'ayu-apropospiate)
