; Crie uma função com assinatura primeiros, a qual recebe um número de elementos, uma lista, e retorna
; uma lista. Esta função deve retornar uma lista com os n primeiros elementos informados no primeiro
; parâmetro. Não utilize nenhuma função pronta to LISP para esta tarefa.

(defun primeiros (m lista)
    (if (or (null lista) (= m 0))
        ()
        (cons (car lista) (primeiros (- m 1) (cdr lista))))
)

(defun main ()
    (write-line (write-to-string (primeiros 3 '(1 2 3 4 5 6 7 8 9))))
    (write-line (write-to-string (primeiros 5 '(3 3 7 8 2 8 0 3 4 9))))
)

(main)
