;;;; exercismpr.asd

(asdf:defsystem #:exercismpr
  :description "Generates (in a simple way) patterns for exercism exercises"
  :author "thrashdin"
  :license  "MIT"
  :version "1.0"
  :serial t
  :components ((:file "package")
               (:file "exercismpr")))
