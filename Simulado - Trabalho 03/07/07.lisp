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

(defun resolveQuadradoMagico (a)
    (setq n (array-dimension a 0))
    (setq i 0)
    (setq j 0)

    (dotimes (i n)
        (dotimes (j n)
            (if (= 0 (aref a i j)) (return))
        )
        (if (= 0 (aref a i j)) (return))
    )

    (if (= 0 (aref a i j))
        (progn (setq a (resolveQuadradoMagicoPorBacktracking a i j)) (if (EhQuadradoMagico a) a (zeraMatriz a)))
        (zeraMatriz a))
)

(defun resolveQuadradoMagicoPorBacktracking (a i j)
)

(defun zeraMatriz (a)
    (setq n (array-dimension a 0))
    (dotimes (i n)
        (dotimes (j n)
            (setf (aref a i j) 0)
        )
    )
    a
)

(defun somaColuna (a j)
    (setq soma 0)
    (setq n (array-dimension a 0))

    (dotimes (i n)
        (setq soma (+ soma (aref a i j)))
    )

    soma
)

(defun somaLinha (a i)
    (setq soma 0)
    (setq n (array-dimension a 0))

    (dotimes (j n)
        (setq soma (+ soma (aref a i j)))
    )

    soma
)

(defun somaDiagonalPrincipal (a)
    (setq soma 0)
    (setq n (array-dimension a 0))

    (dotimes (i n)
        (setq soma (+ soma (aref a i i)))
    )

    soma
)

(defun somaDiagonalSecundaria (a i)
    (setq soma 0)
    (setq n (array-dimension a 0))

    (dotimes (i n)
        (setq soma (+ soma (aref a i (- (- n 1) i))))
    )

    soma
)

(defun main ()
    (setq x (make-array '(3 3) ;criando uma matriz 3x3
       :initial-contents '((0 12 12) (16 10 0) (8 0 0))) ;inicializando a matriz com alguns valores
    )
    (write-line (write-to-string (resolveQuadradoMagico x)))
)


(main)
