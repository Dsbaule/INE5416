(defun main ()
    (setq a (read))
    (setq b (read))
    (setq c (read))
    (write-line (write-to-string ((lambda (a b c) (if (> a b) (if (> a c) a c) (if (> b c) b c))) a b c)))
)

(main)
