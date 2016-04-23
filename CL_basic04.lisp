;; for most lisp function
;; we have two case
;;     null case
;;     non-null case

(defun m-length (list)
  (if (null list)
      0
      (+ 1 (m-length (cdr list)))))

(defun print-list (list)
  (if (not (null list))
      (progn ; open up a block; like the bracket in c
	(princ (car list))
	(print-list (cdr list)))))

;; input may contain number, symbol, list
;; imagine a crazy list
;; (((0 1) x 1) 7 2 3 )
;; what if we want to add them all? (without using many if-else statement)
(defun sum-numbers (list)
  (cond                   ; take multiple conditions
    ((null list)          ; if null list, return 0
     0)
    ((numberp (car list)) ; if contain elements as numbers, sum them up
     (+ (car list) (sum-numbers (cdr list))))
    ((symbolp (car list)) ; if elements is a symbol, sum the rest
     (sum-numbers (cdr list)))
    (t                    ; else if contain a list => (listp (car list))
     (+ (sum-numbers (car list)) (sum-numbers (cdr list))))))
     
;; the thinking is like writing recursive function
;;
;; trace
;; allows you to trace the call of the function
;; (trace sum-numbers)
#|
CL-USER> (trace sum-numbers)
(SUM-NUMBERS)
CL-USER> (sum-numbers '(0 1 2 3 '(4 5 6)))
  0: (SUM-NUMBERS (0 1 2 3 '(4 5 6)))
    1: (SUM-NUMBERS (1 2 3 '(4 5 6)))
      2: (SUM-NUMBERS (2 3 '(4 5 6)))
        3: (SUM-NUMBERS (3 '(4 5 6)))
          4: (SUM-NUMBERS ('(4 5 6)))
            5: (SUM-NUMBERS '(4 5 6))
              6: (SUM-NUMBERS ((4 5 6)))
                7: (SUM-NUMBERS (4 5 6))
                  8: (SUM-NUMBERS (5 6))
                    9: (SUM-NUMBERS (6))
                      10: (SUM-NUMBERS NIL)
                      10: SUM-NUMBERS returned 0
                    9: SUM-NUMBERS returned 6
                  8: SUM-NUMBERS returned 11
                7: SUM-NUMBERS returned 15
                7: (SUM-NUMBERS NIL)
                7: SUM-NUMBERS returned 0
              6: SUM-NUMBERS returned 15
            5: SUM-NUMBERS returned 15
            5: (SUM-NUMBERS NIL)
            5: SUM-NUMBERS returned 0
          4: SUM-NUMBERS returned 15
        3: SUM-NUMBERS returned 18
      2: SUM-NUMBERS returned 20
    1: SUM-NUMBERS returned 21
  0: SUM-NUMBERS returned 21
21
|#
