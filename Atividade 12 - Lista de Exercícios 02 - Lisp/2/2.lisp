(defun soma (lista)
    (if (null lista)
        0
        (+ (car lista) (soma (cdr lista))))
)

(defun numero (lista)
    (if (null lista)
        0
        (+ 1 (numero (cdr lista))))
)

(defun media (lista)
    (/ (soma lista) (numero lista))
)

(defun main ()
    (write-line (write-to-string (media '(3 3 4 4))))
)

(main)
