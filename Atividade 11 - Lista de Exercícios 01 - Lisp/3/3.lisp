(defun areaTriangulo (base alt)
    ( / ( * base alt ) 2 )
)

(defun main()
    (setq base (read))
    (setq alt (read))
    (write-line (write-to-string (areaTriangulo base alt)))
)

(main)
