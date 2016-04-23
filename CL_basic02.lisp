;; special operator: let
;; (let (var)
;;   (...))

(print "=== operator: let  ===")
(print "== 1st expression")
(let (x)
  (print x))

(print "== 2nd expression")
(let ((x 5))
  (print x))

(print "== 3rd expression")
(let ((x 5) (y 3))
  (terpri)
  (princ x)
  (terpri)
  (princ y))

;; however, what if you want y be the value based on x
;; the result is you get ERROR, since x cannot be seen
;; (let ((x 5) (y x)) ===> ERROR
;; use let* instead
(terpri)
(print "=== Operator: let* ===")
(print "== 1st expression")
(let* ((x 5) (y x))
  (terpri) ; print a newline
  (princ x)
  (terpri)
  (princ y))

(print "== 2nd expression")
(let* ((x 5) (y (* 2 x)))
  (terpri)
  (princ x)
  (terpri)
  (princ y))

;; setq
(terpri)
(print "=== Operator: setq ===")
(setq x 314)
(print x)

;; defun
;; defun is an macro
;; it takes three things
;;  - name of the function
;;  - input argument
;;  - expression
(terpri)
(print "=== defun ===")

(defun square (x)
  (* x x))

(print (square 4))
