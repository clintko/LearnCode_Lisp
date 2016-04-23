;; basic lisp expression
;; (0 1 2)
;; 0    --- function
;; 1, 2 --- variables
(print (+ 1 2))

;; variable type
(print "hello world")   ; string
(print #(1 2 3 "test")) ; array, which can hold any data type

;; an empty list equals null, which is called nil in Lisp
(print ())
(print nil)

;; Note: use load function
;; (load "CL_basic01.lisp")
;; the T is the value of load, meaning successfully loaded

;; if operator (note that it is case insensitive)
;; if is not a function, since it does not evaluate the argument
;; (if cond
;;   (...)
;;   (...))
(print "===== first condition: T =====")
(if T
    (print "Condition is TRUE")
    (print "Condition is False"))

(print "===== second condition: 0 =====")
(if 0
    (print "Condition is TRUE")
    (print "Condition is False"))

(print "===== second condition: NIL =====")
(if nil
    (print "Condition is TRUE")
    (print "Condition is False"))


