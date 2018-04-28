; Crie uma função com assinatura apagarEnquanto, a qual recebe uma função como parâmetro e uma lista,
; e retorna uma lista. Esta função deve aplicar a função passada como parâmetro a cada elemento da lista,
; até que algum elemento da lista retorne NIL na aplicação da função. Os elementos da lista resultante são
; então todos os elementos a partir do elemento em que a função passada como parâmetro retornou NIL.
; Por exemplo a chamada (apagarEnquanto par ’(2 4 1 2 3 4 5)) deve retornar (1 2 3 4 5), visto
; que ao testar o elemento 1, a função par retorna NIL. Não utilize nenhuma função pronta to LISP para
; esta tarefa.

(defun apagarEnquanto (fun lista)
    (if (or (null lista) (not (funcall fun (car lista))))
        lista
        (apagarEnquanto fun (cdr lista)))
)

(defun menorQue5 (n) (< n 5))

(defun main ()
    (write-line (write-to-string (apagarEnquanto (function menorQue5) '(1 2 3 4 5 6 7 8 9))))
    (write-line (write-to-string (apagarEnquanto (function menorQue5) '(3 3 7 8 2 8 0 3 4 9))))
)

(main)
