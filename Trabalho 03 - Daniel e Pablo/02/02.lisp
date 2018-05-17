(defun palindrome (a)
    (if (null a)
        T
        (and (lastEquals (cdr a) (car a)) (palindrome (removeLast (cdr a)))))
)

(defun lastEquals (a n)
    (if (null a)
        NIL
        (if (null (cdr a))
            (= (car a) n)
            (lastEquals (cdr a) n)))
)

(defun removeLast (a)
    (if (null (cdr a))
        ()
        (cons (car a) (removeLast (cdr a))))
)

(defun main ()
    (write-line (write-to-string (palindrome '(1 2 3 3 2 1))))
    (write-line (write-to-string (palindrome '(1 2 3 3 3 1))))
    (write-line (write-to-string (palindrome '(1 1 3 3 1 1))))
    (write-line (write-to-string (palindrome '(2 2 3 3 2 1))))
)

(main)
