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

(setq minhaArvorePrima
    (make-no
        :n 4
        :esq (make-no :n 13               ;pode omitir o NIL
                      :esq (make-no :n 2 :esq NIL :dir NIL)
                      :dir (make-no :n 5 :esq NIL :dir NIL)
             )
        :dir (make-no :n 6
                      :esq (make-no :n 15 :esq NIL :dir NIL)
                      :dir (make-no :n 17 :esq NIL :dir NIL)
             )
    )
)

(setq minhaArvore2
    (make-no
        :n 52
        :esq (make-no   :n 32               ;pode omitir o NIL
                        :esq (make-no :n 12
                                    :esq (make-no   :n 33               ;pode omitir o NIL
                                                    :esq (make-no   :n 12
                                                                    :esq (make-no :n 32               ;pode omitir o NIL
                                                                                  :esq (make-no :n 12 :esq NIL :dir NIL)
                                                                                  :dir (make-no :n 35 :esq NIL :dir NIL))
                                                                    :dir NIL)
                                                    :dir (make-no :n 35 :esq NIL :dir NIL))
                                    :dir NIL)
                        :dir (make-no :n 35 :esq NIL :dir NIL))
        :dir (make-no :n 56
                      :esq (make-no :n 55 :esq NIL :dir NIL)
                      :dir (make-no :n 64 :esq NIL :dir NIL)))
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

(defun altura (arv)
    (if (and (null (no-esq arv)) (null (no-dir arv)))
        0
        (+ 1 (max (if (null (no-esq arv)) 0 (altura (no-esq arv))) (if (null (no-dir arv)) 0 (altura (no-dir arv))))))
)

(defun igual (arva arvb)
    (if (and (null arva) (null arvb))
        T
        (if (or (null arva) (null arvb))
            NIL
            (and (= (no-n arva) (no-n arvb)) (igual (no-esq arva) (no-esq arvb)) (igual (no-dir arva) (no-dir arvb)))))
)

(defun folhas (arv)
    (if (null arv)
        ()
        (if (and (null (no-esq arv)) (null (no-dir arv)))
            (list (no-n arv))
            (nconc (folhas (no-esq arv)) (folhas (no-dir arv)))))
)

(defun primoToNaoPrimo (arv)
    (if (null arv)
        ()
        (make-no :n (fixPrimo (no-n arv)) :esq (primoToNaoPrimo (no-esq arv)) :dir (primoToNaoPrimo (no-dir arv))))
)

(defun fixPrimo (n)
    (if (primo n)
        (fixPrimo (+ n 1))
        n)
)

(defun primo (n)
    (if (< n 2)
        NIL
        (primoR n 2))
)

(defun primoR (n x)
    (if (>= x n)
        T
        (if (= (mod n x) 0)
            NIL
            (primoR n (+ x 1))))
)

(defun main()
    ;(write-line (write-to-string (soma minhaArvore)))
    ;(write-line (write-to-string (buscaElemento minhaArvore 35)))
    ;(write-line (write-to-string (buscaElemento minhaArvore 36)))
    ;(write-line (write-to-string (minimoElemento minhaArvore)))
    ;(write-line (write-to-string (incrementa minhaArvore 2)))
    ;(write-line (write-to-string minhaArvore))

    ; ----- Testes para altura

    ;(write-line (write-to-string (altura minhaArvore)))
    ;(write-line (write-to-string (altura minhaArvore2)))

    ; ----- Testes para iguais

    ;(write-line (write-to-string (igual minhaArvore minhaArvore)))
    ;(write-line (write-to-string (igual minhaArvore2 minhaArvore)))
    ;(write-line (write-to-string (igual minhaArvore minhaArvore2)))
    ;(write-line (write-to-string (igual minhaArvore2 minhaArvore2)))

    ; ----- Testes para folhas

    ;(write-line (write-to-string (folhas minhaArvore)))
    ;(write-line (write-to-string (folhas minhaArvore2)))

    ; ----- Testes para primoToNaoPrimo
    (write-line (write-to-string minhaArvorePrima))
    (write-line (write-to-string (primoToNaoPrimo minhaArvorePrima)))
)

(main)
