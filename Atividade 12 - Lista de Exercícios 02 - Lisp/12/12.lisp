; Crie uma função com assinatura apagar, a qual recebe, um número de elementos (n), uma lista, e retorna
; uma lista. Esta função deve remover da lista os n primeiros elementos fornecidos como parâmetro. Por
; exemplo, a chamada (apagar 3 ’(1 2 3 4 5)) deve retornar (4 5). Não utilize nenhuma função
; pronta to LISP para esta tarefa.

(defun apagar (m lista)
    (if (null lista)
        ()
        (if (= m 0)
            lista
            (apagar (- m 1) (cdr lista))))
)

(defun main ()
    (write-line (write-to-string (apagar 3 '(1 2 3 4 5 6 7 8 9))))
    (write-line (write-to-string (apagar 5 '(3 3 7 8 2 8 0 3 4 9))))
)

(main)
