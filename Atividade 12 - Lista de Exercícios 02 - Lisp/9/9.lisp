; Crie uma função com assinatura inverte, a qual recebe uma lista como parâmetro e deve retornar a
; mesma invertida. Não utilize nenhuma função pronta do LISP para realizar esta tarefa.

(defun inverte (lista)
    (if (null lista)
        ()
        (nconc (inverte (cdr lista)) (list (car lista))))
)

(defun main ()
    (write-line (write-to-string (inverte '(1 2 3 4 5 6 7 8 9))))
    (write-line (write-to-string (inverte '(3 3 7 8 2 8 0 3 4 9))))
)

(main)
