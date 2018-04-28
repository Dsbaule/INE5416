(defun abs (x)
    ( if (< 0 x)
        (- 0 x)
        (x)
    )
)

(defun main()
    (setq x (read))
    (write-line (write-to-string (abs x)))
)

(main)
