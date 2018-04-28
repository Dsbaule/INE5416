; Crie uma função com assinatura diferencaMaiorMenor, a qual recebe uma lista de inteiros e retorna
; a diferença entre o maior e o menor elemento da lista. Retorne 0 caso a lista for vazia. Não utilize
; nenhuma função pronta to LISP para esta tarefa.

(defun diferencaMaiorMenor (lista)
    (if (null lista)
        0
        (- (maior lista) (menor lista)))
)

(defun menor (lista)
    (if (null (cdr lista))
        (car lista)
        (minimo (car lista) (menor (cdr lista))))
)

(defun minimo (x y) (if (< x y) x y))

(defun maior (lista)
    (if (null (cdr lista))
        (car lista)
        (maximo (car lista) (maior (cdr lista))))
)

(defun maximo (x y) (if (> x y) x y))

(defun main ()
    (write-line (write-to-string (menor '(3 4 2 1 5))))
    (write-line (write-to-string (maior '(3 4 2 1 5))))
    (write-line (write-to-string (diferencaMaiorMenor '(3 4 2 1 5))))
)

(main)
