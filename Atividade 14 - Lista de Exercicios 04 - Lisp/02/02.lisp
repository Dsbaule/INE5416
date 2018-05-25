(defun main ()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write-line (write-to-string ((lambda (x y z) (>= (/ (+ x y z) 3) 6)) a b c)))
)

(main)
