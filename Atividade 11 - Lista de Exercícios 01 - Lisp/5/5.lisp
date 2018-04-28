(defun media (a b c)
        (/ (+ (+ a b) c) 3)
)

(defun aprovado (a b c)
        (>= (media a b c) 6)
)

(defun main ()
        (write-line (write-to-string (aprovado 3 3 3)))
        (write-line (write-to-string (aprovado 6 6 6)))
        (write-line (write-to-string (aprovado 10 3 5)))
        (write-line (write-to-string (aprovado 4 4 7)))
)

(main)
