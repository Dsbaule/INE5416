(defun mapear (fun lista)
    (if (null lista)
        ()
        (cons (funcall fun (car lista)) (mapear fun (cdr lista))))
)

(defun main ()
    (write-line (write-to-string (mapear (function (lambda (a) (= 0 (mod a 2)))) '(1 2 3 4 5 6 7 8 9))))
)

(main)
