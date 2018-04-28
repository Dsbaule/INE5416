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

; Crie uma função com a seguinte assinatura: ocorrenciasElemento (arv x), a qual recebe um
; número e deve retornar a quantidade de ocorrências dele na árvore.

(defun ocorrenciasElemento (arv x)
    (if (null arv)
        0
        (if (= (no-n arv) x)
            (+ 1 (+ (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x)))
            (+ (ocorrenciasElemento (no-esq arv) x) (ocorrenciasElemento (no-dir arv) x))))
)

; Crie uma função com a seguinte assinatura: maioresQueElemento (arv x), a qual recebe um número
; e deve retornar a quantidade de números maiores que ele na árvore.

(defun maioresQueElemento (arv x)
    (if (null arv)
        0
        (if (> (no-n arv) x)
            (+ 1 (+ (maioresQueElemento (no-esq arv) x) (maioresQueElemento (no-dir arv) x)))
            (+ (maioresQueElemento (no-esq arv) x) (maioresQueElemento (no-dir arv) x))))
)

; Crie uma função com a seguinte assinatura: mediaElementos (arv), a qual deve retornar a média
; dos números na árvore.

(defun mediaElementos (arv)
    (/ (somaElementos arv) (quantidade arv))
)

(defun somaElementos (arv)
    (if (null arv)
        0
        (+ (no-n arv) (+ (somaElementos (no-esq arv)) (somaElementos (no-dir arv)))))
)

; Crie uma função com a seguinte assinatura: quantidade (arv), a qual deve retornar a quantidade
; de elementos na árvore.

(defun quantidade (arv)
    (if (null arv)
        0
        (+ 1 (+ (quantidade (no-esq arv)) (quantidade (no-dir arv)))))
)

; Crie uma função com a seguinte assinatura: elementos (arv), a qual deve retornar uma lista com
; todos os elementos na árvore.

(defun elementos (arv)
    (if (not (null arv))
        (cons (no-n arv) (nconc (elementos (no-esq arv)) (elementos (no-dir arv)))))
)

; Crie uma função com a seguinte assinatura: substituir (arv x y), a qual recebe dois números como
; parâmetro e deve buscar e alterar todas as ocorrências de x pelo valor y.

(defun substituir (arv x y)
    (if (not (null arv))
        (progn
            (setf (no-n arv) (if (= (no-n arv) x) y (no-n arv)))
            (substituir (no-esq arv) x y)
            (substituir (no-dir arv) x y)
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
    (write-line (write-to-string (ocorrenciasElemento minhaArvore 34)))
    (write-line (write-to-string (maioresQueElemento minhaArvore 50)))
    (write-line (write-to-string (mediaElementos minhaArvore)))
    (write-line (write-to-string (quantidade minhaArvore)))
    (write-line (write-to-string (elementos minhaArvore)))
    (write-line (write-to-string (substituir minhaArvore 34 36)))
    (write-line (write-to-string (elementos minhaArvore)))
)

(main)
