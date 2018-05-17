(defun EhQuadradoMagico (a)
    (setq soma 0)
    (setq n (array-dimension a 0))

    (dotimes (i n)
        (setq soma (+ soma (aref a i (- (- n 1) i))))
    )

    (and (checaLinhas a soma) (checaColunas a soma) (checaDiagonalPrincipal a soma))
)

(defun checaLinhas (a soma)
    (setq somaAtual 0)
    (setq n (array-dimension a 0))

    (dotimes (i n)
        (dotimes (j n)
            (setq somaAtual (+ somaAtual (aref a i j)))
        )
        (if (/= somaAtual soma) (return) (setq somaAtual 0))
    )
    (= somaAtual 0)
)

(defun checaColunas (a soma)
    (setq somaAtual 0)
    (setq n (array-dimension a 0))

    (dotimes (j n)
        (dotimes (i n)
            (setq somaAtual (+ somaAtual (aref a i j)))
        )
        (if (/= somaAtual soma) (return) (setq somaAtual 0))
    )
    (= somaAtual 0)
)

(defun checaDiagonalPrincipal (a soma)
    (setq somaAtual 0)
    (setq n (array-dimension a 0))
    (dotimes (i n)
        (setq somaAtual (+ somaAtual (aref a i i)))
    )
    (= somaAtual soma)
)

(defun main ()
    (setq x (make-array '(3 3) ;criando uma matriz 3x3
       :initial-contents '((2 7 6) (9 5 1) (4 3 8))) ;inicializando a matriz com alguns valores
    )
    (setq y (make-array '(3 3) ;criando uma matriz 3x3
       :initial-contents '((2 8 6) (9 6 1) (4 4 8))) ;inicializando a matriz com alguns valores
    )
    (write-line (write-to-string (EhQuadradoMagico x)))
    (write-line (write-to-string (EhQuadradoMagico y)))
)

(main)
