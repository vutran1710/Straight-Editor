;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
                     '(("_st" "const { $1 } = this.state" "extract-state" nil nil nil "/Users/vutran/.emacs.d/snippets/web-mode/state-extract" nil nil)
                       ("sst" "this.setState({ $1 })" "setState" nil nil nil "/Users/vutran/.emacs.d/snippets/web-mode/setState" nil nil)
                       ("_prop" "const { $1 } = this.props" "extract-props" nil nil nil "/Users/vutran/.emacs.d/snippets/web-mode/props-extract" nil nil)
                       ("lorem" "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc rutrum nisl ut ante dignissim, at tempor elit pellentesque. Donec cursus semper arcu semper vestibulum. Morbi et nibh quis nulla mollis vehicula nec luctus nulla. In eleifend rhoncus sagittis. Donec non odio vel neque laoreet aliquet vel quis dui. Duis id metus nisl. Aliquam a est in neque maximus maximus. Maecenas fringilla nibh porta libero eleifend, quis tempus leo auctor. Vestibulum non felis vel nibh laoreet semper vel eu nisi.$1" "lorem ipsum" nil nil nil "/Users/vutran/.emacs.d/snippets/web-mode/lorem-ipsum" nil nil)
                       ("ar2" "${1:function} = ($2) => {\n  $0\n}" "arrow{}" nil nil nil "/Users/vutran/.emacs.d/snippets/web-mode/javascript" nil nil)
                       ("irm" "import { ${1:module} } from '${2:module-path}'\n" "import-part-module" nil nil nil "/Users/vutran/.emacs.d/snippets/web-mode/import-named" nil nil)
                       ("ird" "import ${1:module} from '${2:module-path}'\n" "import-default" nil nil nil "/Users/vutran/.emacs.d/snippets/web-mode/import-default" nil nil)
                       ("ar1" "${1:function} = ($2) => (\n  $0\n)" "arrow()" nil nil nil "/Users/vutran/.emacs.d/snippets/web-mode/+new-snippet+" nil nil)))


;;; Do not edit! File generated at Mon Jan  8 17:28:49 2018
