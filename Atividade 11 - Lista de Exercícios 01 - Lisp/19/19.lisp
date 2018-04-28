(defun goldbach (n)
    (goldbachR n (listPrimos n) (listPrimos n))
)

(defun goldbachR (n primos1 primos2)
    (if (null primos2)
        (goldbachR n (cdr primos1) (cdr primos1))
        (if (= n (+ (car primos1) (car primos2)))
            (car primos1)
            (if (< n (+ (car primos1) (car primos2)))
                (goldbachR n (cdr primos1) (cdr primos1))
                (goldbachR n primos1 (cdr primos2)))))
)

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

(defun listPrimos (n)
    (listPrimosR n 2)
)

(defun listPrimosR (n r)
    (if (>= r n)
        ()
        (if (primo r)
            (cons r (listPrimosR n (+ r 1)))
            (listPrimosR n (+ r 1)))
    )
)

(defun main ()
    (setq n (read))
    (write-line (write-to-string (listPrimos n)))
    (write-line (write-to-string (goldbach n)))
)

(main)
