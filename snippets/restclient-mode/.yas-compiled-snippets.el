;;; Compiled snippets and support files for `restclient-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'restclient-mode
		     '(("va" ":url = ${1}\n:api = ${2}\n" "Vars initializing" nil nil nil "/Users/vutran/.emacs.d/snippets/restclient-mode/vars" nil nil)
		       ("po" "#\n# Perform a POST method\n#\nPOST ${1::url/:res}\nContent-Type: ${2:application/json}\n{${4:body}}\n$0\n" "POST method" nil nil nil "/Users/vutran/.emacs.d/snippets/restclient-mode/post" nil nil)
		       ("ge" "#\n# Performing a GET method\n#\nGET ${1::url/:api}\n$0\n" "GET method" nil nil nil "/Users/vutran/.emacs.d/snippets/restclient-mode/get" nil nil)
		       ("be" "Authorization: Bearer-${1:token}\n$0" "Authorization with Bearer" nil nil nil "/Users/vutran/.emacs.d/snippets/restclient-mode/aux" nil nil)))


;;; Do not edit! File generated at Wed May 12 15:42:46 2021
