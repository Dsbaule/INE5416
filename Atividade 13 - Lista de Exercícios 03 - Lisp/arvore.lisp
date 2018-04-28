(defstruct no
    n
    esq
    dir
)

(setq minhaArvore
    (make-no 
        :n 52
        :esq (make-no :n 32               ;pode omitir o NIL 
                      :esq (make-no :n 12 :esq NIL :dir NIL) 
                      :dir (make-no :n 35 :esq NIL :dir NIL)
             )
        :dir (make-no :n 56 
                      :esq (make-no :n 55 :esq NIL :dir NIL) 
                      :dir (make-no :n 64 :esq NIL :dir NIL)
             ) 
    )
)

(defun soma (arv)
    (if (null arv)
        0
        (+ 
            (no-n arv) 
            (soma (no-esq arv)) 
            (soma (no-dir arv))
        )
    )
)

(defun buscaElemento (arv x)
    (if (null arv)
        NIL
        (or 
            (= (no-n arv) x)
            (buscaElemento (no-esq arv) x) 
            (buscaElemento (no-dir arv) x)
        )
    )
)

(defun minimo (x y)
    (if (< x y)
        x
        y
    )
)

(setq INF 1000)

(defun minimoElemento (arv)
    (if (null arv)
        INF
        (minimo 
            (no-n arv) 
            (minimo 
                (minimoElemento (no-esq arv)) 
                (minimoElemento (no-dir arv))
            )
        )
    )
)

(defun incrementa (arv x)
    (if (not (null arv))
        (progn
            (setf (no-n arv) (+ (no-n arv) x))
            (incrementa (no-esq arv) x)
            (incrementa (no-dir arv) x)
        )
    )
)

(defun main()
    (write-line (write-to-string (soma minhaArvore)))
    (write-line (write-to-string (buscaElemento minhaArvore 35)))
    (write-line (write-to-string (buscaElemento minhaArvore 36)))
    (write-line (write-to-string (minimoElemento minhaArvore)))
    (write-line (write-to-string (incrementa minhaArvore 2)))
    (write-line (write-to-string minhaArvore))
)

(main)