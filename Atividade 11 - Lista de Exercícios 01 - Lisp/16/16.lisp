(defun div (x y)
    (= (mod x y) 0)
)

(defun main ()
    (setq x (read))
    (setq y (read))
    (write-line (write-to-string (div x y)))
)

(main)
