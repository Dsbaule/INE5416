;Crie uma função com assinatura menor, a qual recebe uma lista de inteiros e retorna o menor elemento
;da lista. Retorne 0 caso a lista for vazia. Não utilize nenhuma função pronta to LISP para esta tarefa.

(defun menor (lista)
    (if (null (cdr lista))
        (car lista)
        (minimo (car lista) (menor (cdr lista))))
)

(defun minimo (x y) (if (< x y) x y))

(defun main ()
    (write-line (write-to-string (menor '(3 4 2 1 5))))
)

(main)
