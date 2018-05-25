(defun main ()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write-line (write-to-string ((lambda (x y z) (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))) a b c)))
    (write-line (write-to-string ((lambda (x y z) (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))) a b c)))
)

(main)
