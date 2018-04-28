(defun totienteEuler (n)
    (if (<= n 1)
        0
        (totienteEulerR n (- n 1)))
)

(defun totienteEulerR (n i)
    (if (= i 1)
        1
        ( + (coprimos x i) (totienteEulerR x (- i 1))))
)

(defun coprimos (x y)
    (if (= (MDC x y) 1)
        1
        0
    )
)

(defun MDC (x y)
    (MDCr (max x y) (min x y))
)

(defun MDCr (x y)
    (if (= (mod x y) 0)
        y
        (MDCr y (mod x y)))
)

(defun main ()
    (setq x (read))
    (write-line (write-to-string (totienteEuler x)))
)

(main)
