
(setf x (make-array '(3 3) ;criando uma matriz 3x3
   :initial-contents '((0 1 2 ) (3 4 5) (6 7 8))) ;inicializando a matriz com alguns valores
)

(defun maior(a) 
    (setq m (aref a 0 0)) ;aref permite acessar uma posição i j da matriz, neste caso acesso a posição 0,0 da matriz a
    (dotimes (i 3) ;dotimes permite realizar um número fixo de iterações
        (dotimes (j 3)
            (if (> (aref a i j) m)
                (setq m (aref a i j))
            )
        )
    )
    m ;é o retorno da minha função
)


(defun main()
    (write-line (write-to-string x)) ;imprimindo uma matriz
    
    (write-line (write-to-string (aref x 0 0)))
    (write-line (write-to-string (aref x 1 1)))
    
    (write-line (write-to-string (maior x))) ;passando uma matriz como parâmetro
    
    (setf (aref x 0 1) 33) ;alrerando o elemento da posição 0,1 para 33
    
    (write-line (write-to-string (maior x)))
)


(main)