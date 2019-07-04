(ql:quickload "lisp-unit")
#-xlisp-test (load "lru-cache")

(defpackage #:lru-cache-test
  (:use #:common-lisp #:lisp-unit))

(in-package #:lru-cache-test)

(define-test set-and-get
  (assert-equal
    "dummy"
    (lru-cache:lru-cache "dummy")))

(define-test eviction
  (assert-equal
    "dumm"
    (lru-cache:lru-cache "dumm")))

(define-test stress
  (assert-equal
    "DUM"
    (lru-cache:lru-cache "dum")))

#-xlisp-test
(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :lru-cache-test))
