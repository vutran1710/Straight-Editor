(require 'tide)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(defun my-typescript-mode-hook ()
  (setq typescript-indent-level 2))

(setq-default typescript-indent-level 2)
(setq tide-format-options '(
                            :insertSpaceAfterFunctionKeywordForAnonymousFunctions t
                            :placeOpenBraceOnNewLineForFunctions nil
                            :placeOpenBraceOnNewLineForControlBlocks nil
                            :indentSize 2
                            :tabSize 2
                            :convertTabsToSpaces: t
                            :indentation 2
                            :insertSpaceAfterSemicolonInForStatements t
                            :insertSpaceBeforeAndAfterBinaryOperators t
                            :insertSpaceAfterKeywordsInControlFlowStatements t))


;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook #'my-typescript-mode-hook)
