(defun MDC (x y z)
    (MDC2 (MDC2 x y) z)
)

(defun MDC2 (x y)
    (MDCr (max x y) (min x y))
)

(defun MDCr (x y)
    (if (= (mod x y) 0)
        y
        (MDCr y (mod x y)))
)

(defun main ()
    (setq x (read))
    (setq y (read))
    (setq z (read))
    (write-line (write-to-string (MDC x y z)))
)

(main)
