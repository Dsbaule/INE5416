(defun xor (x y)
        (and (or x y) (not (and x y)))
)

(defun main ()
        (write-line (write-to-string (xor NIL NIL)))
        (write-line (write-to-string (xor NIL T)))
        (write-line (write-to-string (xor T NIL)))
        (write-line (write-to-string (xor T T)))
)

(main)
