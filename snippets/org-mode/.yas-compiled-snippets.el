;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
		     '(("readme" "#+OPTIONS: ^:nil\n#+TITLE: AMAZING APP\n#+DATE: <2018-07-31 Tue>\n#+AUTHOR: Vu Tran\n#+EMAIL: me@vutr.io`\n\n* Content                                                               :TOC:\n- [[#introduction][Introduction]]\n- [[#first][First]]\n\n* Introduction\nlorem ipsum...\n\n* First\nlorem ipsum..." "readme" nil nil nil "/Users/vumacbook/.emacs.d/snippets/org-mode/readme" nil nil)
		       ("src" "#+begin_src ${1: code}\n$0\n#+end_src" "blockcode" nil nil nil "/Users/vumacbook/.emacs.d/snippets/org-mode/+new-snippet+" nil nil)))


;;; Do not edit! File generated at Sun May  2 03:37:26 2021
