(in-package #:cl-user)
(defpackage #:lru-cache
  (:use #:common-lisp)
  (:export #:lru-cache))

(in-package #:lru-cache)

(defclass lru-cache ()
  ())

(defun set (cache key value)
  )

(defun get (cache key)
  )
