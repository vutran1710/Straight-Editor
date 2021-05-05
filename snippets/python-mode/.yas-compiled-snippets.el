;;; Compiled snippets and support files for `python-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
		     '(("var" "${1: var_name} = ${2: value}" "assign_variable" nil nil nil "/Users/vumacbook/.emacs.d/snippets/python-mode/variable" nil nil)
		       ("key" "'${1:key}': ${2:value}" "dict_key_value" nil nil nil "/Users/vumacbook/.emacs.d/snippets/python-mode/key_value" nil nil)
		       ("def" "def ${1:function}(${2:args}):\n    ${3:pass}\n$0" "define-new-function" nil nil nil "/Users/vumacbook/.emacs.d/snippets/python-mode/func" nil nil)
		       ("pdb" "import pdb; pdb.set_trace()$0" "python-debugger" nil nil nil "/Users/vumacbook/.emacs.d/snippets/python-mode/debug" nil nil)
		       ("bp" "breakpoint()\n" "breakpoint" nil nil nil "/Users/vumacbook/.emacs.d/snippets/python-mode/breakpoint" nil nil)))


;;; Do not edit! File generated at Sun May  2 16:17:42 2021
