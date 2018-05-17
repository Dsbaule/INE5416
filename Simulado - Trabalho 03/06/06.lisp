(setf x (make-array '(4 3) ;criando uma matriz 3x3
   :initial-contents '((1 5 9 ) (2 6 10) (3 7 11) (4 8 12))) ;inicializando a matriz com alguns valores
)

(defun rotacionar (a n)
    (rotacionarRecursiva a (mod n (array-dimension a 1)))
)

(defun rotacionarRecursiva (a n)
    (if (= 0 n) a (rotacionarRecursiva (rotacionarParaDireita a) (- n 1)))
)

(defun rotacionarParaDireita (a)
    (setq n (array-dimension a 0))
    (setq m (array-dimension a 1))
    (dotimes (i n)
        (setq y (aref a i (- m 1)))
        (dotimes (j m)
            (if (= j (- m 1))
                (setf (aref a i (- (- m 1) j)) y)
                (setf (aref a i (- (- m 1) j)) (aref a i (- (- m 2) j)))
            )
        )
    )
    a
)

(defun main ()
    (setq n (read))
    (write-line (write-to-string x))
    (write-line (write-to-string (rotacionar x n)))
)

(main)
