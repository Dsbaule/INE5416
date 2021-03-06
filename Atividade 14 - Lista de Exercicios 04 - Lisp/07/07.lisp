(defun filtrar (f lista)
    (if (null lista)
        ()
        (if (funcall f (car lista))
            (cons (car lista) (filtrar f (cdr lista)))
            (filtrar f (cdr lista))
        )
    )
)

(defun main ()
    (write-line (write-to-string (filtrar (function (lambda (a) (= 1 (mod a 2)))) '(1 2 3 4 5 6 7 8 9))))
)

(main)
