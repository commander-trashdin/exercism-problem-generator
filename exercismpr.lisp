;;;; exercismpr.lisp

(in-package #:exercismpr)

(defun make-name (name &optional (testpref ""))
  (concatenate 'string (namestring (asdf:system-source-directory
                                    (make-symbol (package-name *package*))))
               name "/" name testpref ".lisp"))

(defun make-rdm (name)
  (concatenate 'string (namestring (asdf:system-source-directory
                                    (make-symbol (package-name *package*))))
               name "/" "readme.md"))


(defun make-exer-problem (name &rest tests)
  (let ((file-path (make-name name))
        (test-file-path (make-name name "-test")))
    (ensure-directories-exist (concatenate 'string (namestring (asdf:system-source-directory
                                                                (make-symbol (package-name *package*))))
                                           name "/"))
    (with-open-file (stream1 file-path :direction :output :if-exists :overwrite
                                       :if-does-not-exist :create)
      (format stream1 "(in-package #:cl-user)~%(defpackage #:~a~%  (:use #:common-lisp)~%  (:export #:~:*~a))~%~%" name)
      (format stream1 "(in-package #:~a)~%~%" name)
      (format stream1 "(defun ~a (arguments)~%  )" name))
    (with-open-file (stream2 test-file-path :direction :output :if-exists :overwrite
                                            :if-does-not-exist :create)
      (format stream2 "(ql:quickload \"lisp-unit\")
#-xlisp-test (load ~s)~%~%" name)
      (format stream2 "(defpackage #:~a-test
  (:use #:common-lisp #:lisp-unit))~%~%" name)
      (format stream2 "(in-package #:~a-test)~%~%" name)
      (loop :for (tname tinp tres) :in tests
            :do (format stream2 "(define-test ~a
  (assert-equal
    ~s
    (~a:~:*~a ~s)))~%~%" tname tres name tinp))
      (ending stream2 name))
    (with-open-file (stream3 (make-rdm name) :direction :output :if-exists :overwrite
                                             :if-does-not-exist :create)
      (format stream3 "Readme"))))


(defun ending (stream name)
  (format stream "#-xlisp-test~%(let ((*print-errors* t)
      (*print-failures* t))
  (run-tests :all :~a-test))" name))
