(defun soma (lista)
    (if (null lista)
        0
        (+ (car lista) (soma (cdr lista))))
)

(defun main ()
    (write-line (write-to-string (soma '(1 2 3 4 5))))
)

(main)
