(defun fib (n)
    ( if (<= n 1)
        1
        (+ (fib (- n 1)) (fib (- n 2)))
    )
)

(defun main ()
    (setq n (read))
    (write-line (write-to-string (fib n)))
)

(main)
