;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
		     '(("lorem" "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc rutrum nisl ut ante dignissim, at tempor elit pellentesque. Donec cursus semper arcu semper vestibulum. Morbi et nibh quis nulla mollis vehicula nec luctus nulla. In eleifend rhoncus sagittis. Donec non odio vel neque laoreet aliquet vel quis dui. Duis id metus nisl. Aliquam a est in neque maximus maximus. Maecenas fringilla nibh porta libero eleifend, quis tempus leo auctor. Vestibulum non felis vel nibh laoreet semper vel eu nisi.$1" "lorem ipsum" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/lorem-ipsum" nil nil)
		       ("imn" "import { ${1:module} } from '${2:module-path}'\n" "import-part-module" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/import-named" nil nil)
		       ("imd" "import ${1:module} from '${2:path}'" "import default" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/import-default" nil nil)
		       ("fc" "import { FC } from 'react'\n\ntype Props = {\n  // foo: bar\n}\n\nexport const ${1:Component}: FC<Props> = () => (\n   $2\n)\n" "Functional Component" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/fc-react" nil nil)
		       ("ar1" "const ${1:fun} = (${2:...args}) => {\n  $3\n}\n$0" "arrow-function-1" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/arrow-function-1" nil nil)))


;;; Do not edit! File generated at Sun May  2 16:17:42 2021
