
(setf x (make-array '(4 3) ;criando uma matriz 3x3
   :initial-contents '((1 0 0 ) (0 0 0) (0 0 0) (0 0 2))) ;inicializando a matriz com alguns valores
)

(defun pico (a)
    (setq m (array-dimension a 0))
    (setq n (array-dimension a 1))
    (setq p ())
    (dotimes (i m)
        (progn (dotimes (j n)
            (if (and (if (= i 0) T (> (aref a i j) (aref a (- i 1) j)))
                    (if (= i (- m 1)) T (> (aref a i j) (aref a (+ i 1) j)))
                    (if (= j 0) T (> (aref a i j) (aref a i (- j 1))))
                    (if (= j (- n 1)) T (> (aref a i j) (aref a i (+ j 1)))))
                (progn (setq p (aref a i j)) (return))
        )
        (if (not (null p)) (return))))
    )
    p
)

(defun main()
    (write-line (write-to-string x)) ;imprimindo uma matriz
    (write-line (write-to-string (pico x))) ;passando uma matriz como parâmetro
)


(main)
