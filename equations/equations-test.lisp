(ql:quickload "lisp-unit")
#-xlisp-test (load "equations")

(defpackage #:equations-test
  (:use #:common-lisp #:lisp-unit))

(in-package #:equations-test)

(define-test linear
  (assert-equal
    4/3
    (equations:equations '(0 3 4))))

(define-test quadratic
  (assert-equal
    '(5 -3)
    (equations:equations '(1 -2 -15))))

#-xlisp-test
(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :equations-test))
