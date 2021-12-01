;;;; aoc-2021.asd

(asdf:defsystem #:aoc-2021
  :description "Describe aoc-2021 here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:cl-ppcre
               #:local-time
               #:chronicity
               #:alexandria
               #:split-sequence
               #:parse-number)
  :components ((:file "package")
               (:file "aoc-2021")))
