; Achar caminho no labirinto
(defun caminhoSaida(a m n)
    (caminhoSaidaR a m n 0)
)

; Testa recursivamente para todas as entradas na primeira coluna
(defun caminhoSaidaR(a m n i)
    (if (= i (- m 1))
        (achaCaminhoAPartir a m n i 0)
        (if (checaCaminho (achaCaminhoAPartir a m n i 0) m n)
            (achaCaminhoAPartir a m n i 0)
            (caminhoSaidaR a m n (+ 1 i))))
)

; Para cada elemento 0, coloca em 2 e testa para seus vizinhos, se nenhum levar a um caminho, faz o backtracking
(defun achaCaminhoAPartir(a m n i j)
    (if (/= (aref a i j) 0)
        a
        (progn (setf (aref a i j) 2) (if (= j (- n 1)) a (cond
            ((if (> i 0) (checaCaminho (achaCaminhoAPartir a m n (- i 1) j)  m n) NIL) (achaCaminhoAPartir a m n (- i 1) j))
            ((if (> j 0) (checaCaminho (achaCaminhoAPartir a m n i (- j 1))  m n) NIL) (achaCaminhoAPartir a m n i (- j 1)))
            ((if (< i (- m 1)) (checaCaminho (achaCaminhoAPartir a m n (+ i 1) j)  m n) NIL) (achaCaminhoAPartir a m n (+ i 1) j))
            ((if (< j (- n 1)) (checaCaminho (achaCaminhoAPartir a m n i (+ j 1))  m n) NIL) (achaCaminhoAPartir a m n i (+ j 1)))
            a
            ))  
        )
    )
)

; Inicia verificacao recursiva da primeira coluna
(defun checaCaminho(a m n)
    (checaCaminhoR a m n 0)
)

; para cada elemento 2 na primeira coluna, checa se leva ao fim por algum caminho
(defun checaCaminhoR(a m n i)
    (if (= i (- m 1))
        (checaCaminhoAPartir a m n i 0)
        (or (checaCaminhoAPartir a m n i 0) (checaCaminhoR a m n (+ i 1))))
)

; Para todo elemento 2, zera e testa os seus vizinhos, se chegar a um elemento 2 na ultima coluna, existe um caminho
(defun checaCaminhoAPartir(a m n i j)
    (if (/= (aref a i j) 2)
        NIL
        (if (= j (- n 1))
            T
            (progn (setf (aref a i j) 0)
            (or
                (if (> i 0) (checaCaminhoAPartir a m n (- i 1) j) NIL)
                (if (< i (- m 1)) (checaCaminhoAPartir a m n (+ i 1) j) NIL)
                (if (> j 0) (checaCaminhoAPartir a m n i (- j 1)) NIL)
                (if (< j (- n 1)) (checaCaminhoAPartir a m n i (+ j 1)) NIL)))
        )
    )
)

(defun main ()
    (setq x (make-array '(5 5)
        :initial-contents '((1 0 0 0 1) (1 0 1 0 1) (1 0 1 0 1) (1 0 1 0 1) (0 0 1 0 0)))
    )
    (write-line (write-to-string (caminhoSaida x 5 5)))
)

(main)
