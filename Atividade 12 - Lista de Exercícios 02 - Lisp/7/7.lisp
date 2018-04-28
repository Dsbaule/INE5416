; Crie uma função com assinatura enesimo, a qual recebe uma lista de inteiros e um inteiro n e retorna o
; n-ésimo elemento na lista. Não utilize nenhuma função pronta to LISP para esta tarefa.

(defun enesimo (lista n)
    (if (null lista)
        ()
        (if (= n 0)
            (car lista)
            (enesimo (cdr lista) (- n 1))))
)

(defun main ()
    (write-line (write-to-string (enesimo '(3 3 2 1 5) 3)))
    (write-line (write-to-string (enesimo '(3 3 2 1 5) 2)))

)

(main)
