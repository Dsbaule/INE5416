(defun intersecao (a b)
    (if (not (or (null a) (null b)))
        ( if (/= (list-length b) (list-length (remove (car a) b)))
            (cons (car a) (intersecao (remove (car a) (cdr a)) (remove (car a) b)))
            (intersecao (remove (car a) (cdr a)) b)
        )
    )
)

(defun main ()
    (write-line (write-to-string (intersecao '(1 2 3 4 5 5 5 5 5) '(1 3 5 7 9))))
)

(main)
