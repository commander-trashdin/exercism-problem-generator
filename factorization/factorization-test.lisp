(ql:quickload "lisp-unit")
#-xlisp-test (load "factorization")

(defpackage #:factorization-test
  (:use #:common-lisp #:lisp-unit))

(in-package #:factorization-test)

(define-test prime1
    (assert-equal
     '((7 . 1))
     (factorization:factorization 7)))

(define-test prime2
    (assert-equal
     '((1000000007 . 1))
     (factorization:factorization 1000000007)))

(define-test simple
    (assert-equal
     '((2 . 2) (3 . 3) (5 . 1))
     (factorization:factorization 540)))

(define-test long1
    (assert-equal
     '((23 . 4) (100003 . 1))
     (factorization:factorization 27984939523)))

(define-test long
    (assert-equal
     '((2 . 2) (3 . 2) (7 . 2) (101 . 4))
     (factorization:factorization 183562547364)))

#-xlisp-test
(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :factorization-test))
