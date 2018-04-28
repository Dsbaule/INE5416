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
    (setq y (read))
    (write-line (write-to-string (MDC x y)))
)

(main)
