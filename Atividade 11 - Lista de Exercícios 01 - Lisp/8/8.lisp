(defun bhaskara (a b c)
    (cons
        (/ (- (sqrt (- (* b b) (* 4 (* a c)))) b) (* 2 a))
        (/ (- (- (sqrt (- (* b b) (* 4 (* a c))))) b) (* 2 a))
    )
)

(defun main ()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write-line (write-to-string (bhaskara a b c)))
)

(main)
