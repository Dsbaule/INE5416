(defun potencia (x y)
    ( if (= 0 y)
        1
        (* x (potencia x (- y 1)))
    )
)

(defun main()
    (setq x (read))
    (setq y (read))
    (write-line (write-to-string (potencia x y)))
)

(main)
