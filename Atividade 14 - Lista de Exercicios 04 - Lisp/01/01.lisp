(defun sequencia (n)
    (cond
        ((eq n 0) 5)
        (t (+ (sequencia (- n 1)) 4 (* 2 n))))
)

(defun main ()
    (write-line (write-to-string (sequencia 0)))
    (write-line (write-to-string (sequencia 1)))
    (write-line (write-to-string (sequencia 2)))
    (write-line (write-to-string (sequencia 3)))
    (write-line (write-to-string (sequencia 4)))
    (write-line (write-to-string (sequencia 5)))
)

(main)
