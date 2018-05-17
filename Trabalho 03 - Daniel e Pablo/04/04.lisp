(setf x (make-array '(4 3) ;criando uma matriz 3x3
   :initial-contents '((1 5 7) (3 1 10) (3 5 3) (4 8 4))) ;inicializando a matriz com alguns valores
)

(defun repetidos(a m n)
    (setq listaRepetidas ())
    (dotimes (i m)
        (dotimes (j n)
            (dotimes (k m)
                (dotimes (l n)
                    (if (not (and (= i k) (= j l)))
                        (if (= (aref a i j) (aref a k l))
                            (setq listaRepetidas (adicionaRepetida listaRepetidas (aref a i j)))))
                )
            )
        )
    )
    listaRepetidas
)

(defun adicionaRepetida (lista a)
    (if (null lista)
        (list a)
        (if (= a (car lista))
            lista
            (cons (car lista) (adicionaRepetida (cdr lista) a))))
)

(defun main ()
    (write-line (write-to-string (repetidos x 4 3)))
)

(main)
