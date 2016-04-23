(defun tryLoop ()
  (loop
     (setq x (+ x 1))
     (when (> x 7) (return x)))
  (print 3)
  )

(setf path (make-pathname :name fileName :type "txt"))
(setf str (open path :direction :input)


(defun readFile01 (fileName)
  (let (path str line (data nil))

    (setf path (make-pathname :name fileName :type "txt")) 
    (setf str (open path :direction :input))
    (setf line (read-line str))
    (setf data (cons line data))
    (setf line (read-line str))
    (setf data (cons line data))
    (print data)
    (close str)
    ) ; end let
  
) ; end defun

(defun readFile02 (fileName)
  ;;(let (path str line (data nil))
  (let (path str line)
    (setf path (make-pathname :name fileName :type "txt")) 
    (setf str (open path :direction :input)) 
    (loop
       (setf line (read-line str))
       (print line)
     (when (eq line nil)(return line))
    )
    (close str)
    ;;(print line)
  ) ; end let
) ; end defun

;; read file
;; https://www.rosettacode.org/wiki/Read_entire_file#Common_Lisp
(defun readFile02 (fileName)
  (let (path str line (data nil))
    (setf path (make-pathname :name fileName :type "txt")) 
    (setf str (open path :direction :input))
    (loop
       for line = (read-line str nil 'eof)
       until (eq line 'eof)
       (print line)) ; end loop
    (close str)
  ) ; end let
) ; end defun

(defun readFile02 (path, line)
  (with-open-file (stream path)
    (let ((data (make-string (file-length stream))))
      (read-sequence data stream)
      data)))
