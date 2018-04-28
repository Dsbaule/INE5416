; Crie uma função com assinatura ocorrencias, a qual recebe uma lista de inteiros e um inteiro e retorna o
; número de vezes em que o elemento está presente na lista. Não utilize nenhuma função pronta to LISP
; para esta tarefa.

(defun ocorrencias (lista n)
    (if (null lista)
        0
        (+ (if (= (car lista) n) 1 0) (ocorrencias (cdr lista) n)))
)


(defun main ()
    (write-line (write-to-string (ocorrencias '(3 3 2 1 5) 3)))
    (write-line (write-to-string (ocorrencias '(3 3 2 1 5) 5)))

)

(main)
