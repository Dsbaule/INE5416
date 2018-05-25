(defun main ()
    (setq a (read))
    (setq b (read))
    (write-line (write-to-string ((lambda (x y) (and (or x y) (not (and x y)))) a b)))
)

(main)
