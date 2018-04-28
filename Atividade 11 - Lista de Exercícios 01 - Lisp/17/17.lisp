(defun primo (n)
    (primoR n (- n 1))
)

(defun primoR (n i)
    (if (<= i 1)
        T
        (if (= (mod n i) 0)
            NIL
            (primoR n (- i 1))))
)

(defun main ()
    (setq n (read))
    (write-line (write-to-string (primo n)))
)

(main)
