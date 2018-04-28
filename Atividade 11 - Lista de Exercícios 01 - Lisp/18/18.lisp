(defun op (c x y)
    (cond
        ((char= c #\+) (+ x y))
        ((char= c #\-) (- x y))
        ((char= c #\*) (* x y))
        ((char= c #\/) (/ x y))
    )
)

(defun main ()
    (setq c (read-char))
    (setq x (read))
    (setq y (read))
    (write-line (write-to-string (op c x y)))
)

(main)
