; Crie uma função com assinatura mapear, a qual recebe uma função e uma lista e retorna uma lista.
; Esta função mapear fará o mesmo que a função map do Haskell, ou seja, aplicar a função recebida como
; parâmetro sobre cada elemento da lista e retornar a lista resultante. Não utilize nenhuma função pronta
; do LISP para realizar esta tarefa.

(defun mapear (fun lista)
    (if (null lista)
        ()
        (cons (funcall fun (car lista)) (mapear fun (cdr lista))))
)

(defun add2 (n)
    (+ n 2)
)

(defun main ()
    (write-line (write-to-string (mapear (function add2) '(1 2 3 4 5 6 7 8 9))))
    (write-line (write-to-string (mapear (function add2) '(3 3 7 8 2 8 0 3 4 9))))
)

(main)
