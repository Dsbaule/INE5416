; Crie uma função com assinatura fatia, a qual recebe uma lista de inteiros, um inteiro n e um inteiro m
; e retorna todos os elementos da lista a partir da posição n (inclusive) até a posição m (exceto o elemento
; da posição m). Não utilize nenhuma função pronta to LISP para esta tarefa.

(defun fatia (lista n m)
    (listaDe (listaAte lista m) n)
)

(defun listaDe (lista n)
    (if (null lista)
        ()
        (if (= (car lista) n)
            lista
            (listaDe (cdr lista) n)))
)

(defun listaAte (lista m)
    (if (null lista)
        ()
        (if (= (car lista) m)
            (list m)
            (cons (car lista) (listaAte (cdr lista) m))))
)

(defun main ()
    (write-line (write-to-string (fatia '(1 2 3 4 5 6 7 8 9) 3 7)))
    (write-line (write-to-string (fatia '(3 3 7 8 2 8 0 3 4 9) 2 4)))
)

(main)
