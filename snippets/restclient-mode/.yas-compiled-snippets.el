;;; Compiled snippets and support files for `restclient-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'restclient-mode
                     '(("post" "POST ${1::url/:res}\nContent-Type: ${2:application/json}\nAuthorization: ${3:some-bearer}\n{${4:body}}\n$0\n" "post" nil nil nil "/Users/vumacbook/.emacs.d/snippets/restclient-mode/post" nil nil)
                       ("init" ":url = http://localhost:${1:3000}\n:res = ${2:todos}\n\nGET :url/:res$0" "init default" nil nil nil "/Users/vumacbook/.emacs.d/snippets/restclient-mode/init default" nil nil)))


;;; Do not edit! File generated at Tue Dec 25 11:59:01 2018
