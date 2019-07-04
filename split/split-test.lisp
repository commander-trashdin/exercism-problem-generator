(ql:quickload "lisp-unit")
#-xlisp-test (load "split")

(defpackage #:split-test
  (:use #:common-lisp #:lisp-unit))

(in-package #:split-test)

(define-test simple
  (assert-equal
    #("aba" "caba" "1")
    (split:split "aba caba 1")))

(define-test empty
  (assert-equal
    #("")
    (split:split "")))

(define-test full-match
  (assert-equal
    #("" "")
    (split:split "full match" "full match")))

(define-test some-tests
  (assert-equal
   #("just", "", "a", "test", "")
    (split:split "just  a test ")))

#-xlisp-test
(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :split-test))
