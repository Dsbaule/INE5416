(defun maior (x y z)
    ( if (> x y)
        ( if (> x z)
            x
            z )
        ( if (> y z)
            y
            z ))
)

(defun main ()
    (setq x (read))
    (setq y (read))
    (setq z (read))
    (write-line (write-to-string (maior x y z)))
)

(main)
