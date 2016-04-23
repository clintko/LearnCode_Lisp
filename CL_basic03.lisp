;; operator quote
;; preventing lisp from evaluate
(quote 5)
(quote (0 1 2 3 4)) ; in this way the 0 will not be viewed as a function, taking 1 2 3 4 as argument

;; short hand for using quote
;; '
'(0 1 2 3 4)

;; symbol
;; Using C to illustrate the idea
#|
enum command {PINRT = 0, READ};

void doCommand (enum command c) {
    if (c == PRINT)
        printf(...);
    else if (c == READ)
        scanf(...);
} 
|#

#|
(defun do-command (c) ; "-" is lisp convention, do-command == docommand
  (if (eq c 'print)
      (print "haha")
      (if (eq c 'read)
	  (read ...)))
|#

;; data type: lists
;; we have two functions
;; car
;;     return first item of the list
;; ex:
;;     (car '(a b c)) => 'a
;;     (car '(b c))   => 'b
;;     (car ())       => ()
;; cdr
;;     return the rest of the elements
;; ex.
;;     (cdr '(a b c)) => '(b c)
;;     (cdr '(b c))   => 'c
;;     (cdr ())       => ()
(defun sum (list) ; two case: empty or not empty
  (if (null list) ; null is a function that check if list is empty
      0
      (+ (car list) (sum (cdr list)))))




