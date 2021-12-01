;;;; aoc-2021.lisp

(in-package :cl-user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (ql:quickload :local-time :silent t)
  (ql:quickload :chronicity :silent t)
  (ql:quickload :alexandria :silent t)
  (ql:quickload :parse-number :silent t)
  (ql:quickload :split-sequence :silent t)
  (ql:quickload :cl-ppcre :silent t))

(in-package #:aoc-2021)

(defun cartesian-product (s1 s2)
  "Compute the cartesian product of two sets represented as lists"
  (loop for x in s1
	nconc (loop for y in s2 collect (list x y))))

(defun load-1d-int-array-from-file(filename)
  (with-open-file (in filename :direction :input)
    (let* ((data (loop :for line := (read-line in nil)
                       :while line
                       :collect (parse-number:parse-number line ))))
      (format t "~A" data)
      (make-array (list (length data)) :initial-contents data))))

(defun load-int-list-from-file(input-file)
  (mapcar #'parse-integer (uiop:read-file-lines input-file)))

(defun solution-1-1 (input-file)
  (let ((vals (load-int-list-from-file input-file)))
    (count-if #'(lambda (l) (< (first l) (second l)))
              (mapcar #'list vals (cdr vals)))))

(defun solution-1-2 (input-file)
  (let* ((vals (load-int-list-from-file input-file))
         (sliding-sums (map 'list  #'(lambda (l)
                                       (reduce '+ l))
                   (mapcar #'list vals (cdr vals) (cddr vals)))))
    (count-if #'(lambda (l)
                  (< (first l) (second l)))
              (mapcar #'list sliding-sums (cdr sliding-sums)))))
