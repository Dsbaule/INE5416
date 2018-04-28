; Crie uma função com assinatura busca, a qual recebe uma lista de inteiros e um inteiro e retorna se o
; elemento passado como parâmetro encontra-se na lista ou não. Não utilize nenhuma função pronta do
; LISP para realizar esta tarefa.

(defun busca (lista n)
    (if (null lista)
        NIL
        (if (= (car lista) n)
            T
            (busca (cdr lista) n)))
)

(defun main ()
    (write-line (write-to-string (busca '(3 4 2 1 5) 7)))
    (write-line (write-to-string (busca '(3 4 2 1 5) 5)))

)

(main)
