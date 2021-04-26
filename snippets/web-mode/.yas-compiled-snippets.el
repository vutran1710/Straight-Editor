;;; Compiled snippets and support files for `web-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'web-mode
		     '(("rssl" "import React from 'react'\n\nconst ${1:Component} = ({ ${2:props} }) => (\n  $3\n)\n\nexport default $1" "React Stateless Component" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/stateless-component" nil nil)
		       ("_st" "const { $1 } = this.state" "extract-state" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/state-extract" nil nil)
		       ("sst" "this.setState({ $1 })" "setState" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/setState" nil nil)
		       ("cdm" "  componentDidMount() {\n    $0\n  }\n" "React_componentDidMount" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/react_cdm" nil nil)
		       ("rcc" "${1:export default }class ${2:Component} extends React.Component {\n  state = {\n    $3\n  }\n  render() {\n    return (\n      $4\n    )\n  }\n}\n$0" "react-class" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/react-class" nil nil)
		       ("_prop" "const { $1 } = this.props" "extract-props" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/props-extract" nil nil)
		       ("lorem" "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc rutrum nisl ut ante dignissim, at tempor elit pellentesque. Donec cursus semper arcu semper vestibulum. Morbi et nibh quis nulla mollis vehicula nec luctus nulla. In eleifend rhoncus sagittis. Donec non odio vel neque laoreet aliquet vel quis dui. Duis id metus nisl. Aliquam a est in neque maximus maximus. Maecenas fringilla nibh porta libero eleifend, quis tempus leo auctor. Vestibulum non felis vel nibh laoreet semper vel eu nisi.$1" "lorem ipsum" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/lorem-ipsum" nil nil)
		       ("log" "console.log(${1:something});" "log" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/log" nil nil)
		       ("ar2" "${1:function} = ($2) => {\n  $0\n}" "arrow{}" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/javascript" nil nil)
		       ("irm" "import { ${1:module} } from '${2:module-path}'\n" "import-part-module" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/import-named" nil nil)
		       ("idm" "import ${1:module} from '${2:path}'" "import default" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/import-default" nil nil)
		       ("func" "${1:function} ($2) {\n  $0\n}" "method-function" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/func" nil nil)
		       ("static" "{% static '$1' %}" "static" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/dj_static" nil nil)
		       ("block" "{% block $1 %}\n$0\n{% endblock %}" "block" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/dj_block" nil nil)
		       ("db" "debugger" "db" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/debug" nil nil)
		       ("constro" "const ${1:name} = $2 => ({\n  $0\n})" "const-return-object" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/const-return-object" nil nil)
		       ("constf" "const ${1:function} = ($2) => {\n  $0\n}" "const-function" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/const-function" nil nil)
		       ("ar1" "const ${1:Component} = (${2:props}) => (\n  $3\n)\n$0" "functional_react" nil nil nil "/Users/vumacbook/.emacs.d/snippets/web-mode/ar1" nil nil)))


;;; Do not edit! File generated at Mon Apr 26 19:07:58 2021
