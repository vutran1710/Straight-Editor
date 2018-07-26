(deftheme ayu-nord
  "Created 2018-05-12.")

(custom-theme-set-faces
 'ayu-nord
 '(default ((t (:family "Fira Code" :foundry "nil" :width normal :height 120 :weight light :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#D8DEE9" :background "#252a33" :stipple nil :inherit nil))))
 '(cursor ((t (:background "#D8DEE9"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((((type w32)) (:foundry "outline" :family "Arial")) (t (:family "Sans Serif"))))
 '(escape-glyph ((t (:foreground "#D08770"))))
 '(homoglyph ((((background dark)) (:foreground "cyan")) (((type pc)) (:foreground "magenta")) (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:weight bold :foreground "#88C0D0"))))
 '(highlight ((t (:foreground "#88C0D0" :background "#434C5E"))))
 '(region ((t (:background "#434C5E"))))
 '(shadow ((t (:foreground "#4C566A"))))
 '(secondary-selection ((t (:background "#434C5E"))))
 '(trailing-whitespace ((t (:foreground "#4C566A"))))
 '(font-lock-builtin-face ((t (:foreground "#81A1C1"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#4c566a"))))
 '(font-lock-comment-face ((t (:foreground "#4c566a"))))
 '(font-lock-constant-face ((t (:foreground "#81A1C1"))))
 '(font-lock-doc-face ((t (:foreground "#4c566a"))))
 '(font-lock-function-name-face ((t (:foreground "#e8bc5f"))))
 '(font-lock-keyword-face ((t (:foreground "#80a0c1"))))
 '(font-lock-negation-char-face ((t (:foreground "#81A1C1"))))
 '(font-lock-preprocessor-face ((t (:weight bold :foreground "#5E81AC"))))
 '(font-lock-regexp-grouping-backslash ((t (:foreground "#EBCB8B"))))
 '(font-lock-regexp-grouping-construct ((t (:foreground "#EBCB8B"))))
 '(font-lock-string-face ((t (:foreground "#A3BE8C" :slant italic))))
 '(font-lock-type-face ((t (:foreground "#c06169" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "#a1c1c1"))))
 '(font-lock-warning-face ((t (:foreground "#EBCB8B"))))
 '(button ((t (:box (:line-width 2 :color "#D8DEE9" :style sunken-button) :foreground "#88C0D0" :background "#2E3440"))))
 '(link ((t (:underline (:color foreground-color :style line)))))
 '(link-visited ((t (:underline (:color foreground-color :style line)))))
 '(fringe ((t (:foreground "#D8DEE9" :background "#2E3440"))))
 '(header-line ((t (:foreground "#D8DEE9" :background "#434C5E"))))
 '(tooltip ((t (:foreground "#2E3440" :background "#D8DEE9"))))
 '(mode-line ((t (:foreground "#88C0D0" :background "#4C566A"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((t (:inherit (highlight)))))
 '(mode-line-inactive ((t (:foreground "#D8DEE9" :background "#3B4252"))))
 '(isearch ((t (:foreground "#2E3440" :background "#88C0D0"))))
 '(isearch-fail ((t (:foreground "#BF616A"))))
 '(lazy-highlight ((((class color) (min-colors 88) (background light)) (:background "paleturquoise")) (((class color) (min-colors 88) (background dark)) (:background "paleturquoise4")) (((class color) (min-colors 16)) (:background "turquoise3")) (((class color) (min-colors 8)) (:background "turquoise3")) (t (:underline (:color foreground-color :style line)))))
 '(match ((t (:inherit (isearch)))))
 '(next-error ((t (:inherit (error)))))
 '(query-replace ((t (:foreground "#88C0D0" :background "#434C5E"))))
 '(linum-highlight-face ((t (:foreground "#88c0d0"))))
 '(linum ((t (:foreground "#505050")))))

(provide-theme 'ayu-nord)
