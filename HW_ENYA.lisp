;; Enya programming language Homework
;; Course: NCTU Programming Language
;; Desc:
;; implement the bash command "diff file1 file2"

;; the initialization below is no need
;;(defvar path) ; define variable path as the path of the file
;;(defvar str)  ; stream

;; function: file2List
;; read in the file and concatenate content into list
;; param:  fileName (String) ; the name of the file
;; return: (List)
(defun file2List (fileName)
  (let ((in (open fileName :if-does-not-exist nil))
	(data nil))
    (when in
      (loop for line = (read-line in nil)
	 ;;while line do (format t "~a~%" line)
	 while line do ; foreach line in file
	   (setf data  ; append to list data
	     (cons     ; concatenate to list
	       (string-trim '(#\Return) line) ; trim out ^M
	       data))  ; end setf 
       ) ; end loop
    (close in)      ; close the input stream
    (return-from file2List (nreverse data)) ; reverse the list
    ) ; end when
  ) ; end let 
) ; end defun

;; function: contain & contain-body
;; return true if input item to each element in list
;; note:
;;     the function contain is the one called by user
;;     where the contain-body is the one that do the job
;; param: itemList (List)
;; param: item
;; return: (List)
(defun contain (strList str)
  (contain-body strList nil str)
  ) ; end defun

(defun contain-body (strList container str)
  (if (eq strList nil)
      ;; base case: return empty list
      (return-from contain-body nil)
      ;; recursive case: check if itemList[0] == item
      (if (string= (car strList) str)
	  ;; if itemList[0] == item, return rest of the list
	  (return-from contain-body
	    (cons
	     (nreverse container)
	     (cdr strList)))
	  ;; if itemList[0] != item,
	  ;; store itemList[0] into container and
	  ;; return if rest of the list contain the item
	  (return-from contain-body
	    (contain-body
	     (cdr strList)
	     (cons (car strList) container)
	     str))
	  ) ; end inner if
      ) ; end outer if
  ) ; end defun

;; helper function: printList
;; the function print elements of the input list
;; as the function print each elements, it will
;; add the input string in front of each element
;; param: strList (List of String)
;; param: str (String)
(defun printList (strList str)
  (loop for item in strList
       do (print (concatenate 'string str item)))
  ) ; end defun

(defun main ()
  (let (listFile1 listFile2 listTempt)
    (setf listFile1 (file2List "file3.txt"))
    (setf listFile2 (file2List "file4.txt"))
    ;;(setf listFile1 '("1" "2" "3" "4"))
    ;;(setf listFile2 '("10" "2" "5"))
    ;;(setf listFile1 '("10" "11" "12" "1" "2" "3" "4" "5"))
    ;;(setf listFile2 '("100" "3" "7" "1" "8" "9"))
    (print listFile1)
    (print listFile2)
    
    ;; loop through each item in list of file2
    (loop for item in listFile2
       do (progn ; 1st progn
	    ;; check if list of file1 contain the item
	    (setf listTempt (contain listFile1 item))
	    (if listTempt
		
		;; if true,
		(progn ; 2nd progn
		  ;; update list of file1
		  (setf listFile1 (cdr listTempt))
		  
		  ;; pretty printing, avoiding multiple seperator (+++++)
		  ;;(if (car listTempt)
		  ;;    (progn ; 3rd progn
		  ;;    (printList (car listTempt) "- ")
		  ;;    (print "+++++")))
		  
		  (printList (car listTempt) "- ")
		  (print item)
		  ) ; end 2nd progn
		
		;; if false
		;; update container
		(print (concatenate 'string "+ " item))
		) ; end if
	    ) ; end 1st progn
	 ) ; end loop
    (printList listFile1 "- ")
    ) ; end let
  ) ; end defun

;; execute main
(main)
