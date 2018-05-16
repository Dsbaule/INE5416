(defun pell (n)
    (cond
        ((eq n 0) 0)
        ((eq n 1) 1)
        (t (+ (* 2 (pell (- n 1))) (pell (- n 2))))
    )
)

(defun main ()
    (write-line (write-to-string (pell 0)))
    (write-line (write-to-string (pell 1)))
    (write-line (write-to-string (pell 2)))
    (write-line (write-to-string (pell 3)))
    (write-line (write-to-string (pell 4)))
    (write-line (write-to-string (pell 5)))
)

(main)
