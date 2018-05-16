(setf x (make-array '(4 3) ;criando uma matriz 3x3
   :initial-contents '((1 0 0 ) (0 0 0) (0 0 0) (0 0 2))) ;inicializando a matriz com alguns valores
)

(defun rotacionar (a n)
    (rotacionarRecursiva a (mod n 4))
)

(defun rotacionarRecursiva (a n)
    (if (= 0 n) a (rotacionarRecursiva (rotacionarParaDireita a) (- n 1)))
)

(defun rotacionarParaDireita (a)
    (setq n (array-dimension x 0))
    (setq m (array-dimension x 1))
    (setf y (make-array (cons n m)))
    (dotimes (i n)
        (dotimes (j m)
            (setf (aref y j i) (aref x i (- (- m 1) j)))
        )
    )
    y
)

(defun main ()
    (write-line (write-to-string x))
    (setq n (array-dimension x 0))
    (setq m (array-dimension x 1))
    (setf y (make-array (cons n m)))
    (write-line (write-to-string (rotacionar x 1)))
    (write-line (write-to-string (rotacionar x 2)))
    (write-line (write-to-string (rotacionar x 3)))
    (write-line (write-to-string (rotacionar x 4)))
)

(main)
