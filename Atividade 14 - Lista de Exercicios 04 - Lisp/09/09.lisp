(defun EhPermutacao (a)
    (and (checaLinhas a) (checaColunas a))
)

(defun checaLinhas (a)
    (setq n (array-dimension a 0))
    (setq ehPermutacao T)
    (setq achouUm NIL)

    (dotimes (i n)
        (dotimes (j n)
            (if (= (aref a i j) 1) (if achouUm (progn (setq ehPermutacao NIL) (return)) (setq achouUm T)) (if (/= (aref a i j) 0) (progn (setq ehPermutacao NIL) (return))))
        )
        (if (and ehPermutacao achouUm)
            (setq achouUm NIL)
            (progn (setq ehPermutacao NIL) (return))
        )
    )
    ehPermutacao
)

(defun checaColunas (a)
    (setq n (array-dimension a 0))
    (setq ehPermutacao T)
    (setq achouUm NIL)

    (dotimes (j n)
        (dotimes (i n)
            (if (= (aref a i j) 1) (if achouUm (progn (setq ehPermutacao NIL) (return)) (setq achouUm T)) (if (/= (aref a i j) 0) (progn (setq ehPermutacao NIL) (return))))
        )
        (if (and ehPermutacao achouUm)
            (setq achouUm NIL)
            (progn (setq ehPermutacao NIL) (return))
        )
    )
    ehPermutacao
)

(defun main ()
    (setq x (make-array '(3 3) ;criando uma matriz 3x3
       :initial-contents '((1 0 0) (0 1 0) (0 0 1))) ;inicializando a matriz com alguns valores
    )
    (setq y (make-array '(3 3) ;criando uma matriz 3x3
       :initial-contents '((1 0 0) (1 0 0) (0 0 1))) ;inicializando a matriz com alguns valores
    )
    (write-line (write-to-string (EhPermutacao x)))
    (write-line (write-to-string (EhPermutacao y)))
)

(main)
