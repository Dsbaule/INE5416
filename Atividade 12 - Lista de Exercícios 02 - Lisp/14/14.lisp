(defun alunos()
    '((1 "Bob" (5.6 8 9.3))
      (2 "Ana" (8.2 9 7 6.5))
      (3 "Tom" (3.2 7 5.7 8.3))
      (4 "Bin" (7.5 5.3 8.5 6.2 3.1))
      (5 "Bia" (6.7 4.1 5.5)))
)

(defun getNome (aluno)
    (car (cdr aluno))
)

(defun getNotas (aluno)
    (car (cdr (cdr aluno)))
)

(defun getNomes (lista)
    (if (null lista)
        ()
        (cons (getNome (car lista)) (getNomes (cdr lista)))
    )
)

; Crie uma função com o seguinte nome: medias, a qual recebe uma lista de alunos e retorna uma lista
; de duplas, onde cada dupla contém o nome e a média de cada aluno. Note que cada aluno pode ter
; um número diferente de notas.

(defun soma (lista)
    (if (null lista)
        0
        (+ (car lista) (soma (cdr lista))))
)

(defun numero (lista)
    (if (null lista)
        0
        (+ 1 (numero (cdr lista))))
)

(defun media (lista)
    (/ (soma lista) (numero lista))
)

(defun getMedia (aluno)
    (media (getNotas aluno))
)

(defun medias (lista)
    (if (null lista)
        ()
        (cons (list (getNome (car lista)) (getMedia (car lista))) (medias (cdr lista))))
)

;Crie uma função com o seguinte nome: mediaTurma, a qual recebe uma lista de alunos e retorna a
;média da turma.

(defun mediaTurma (lista)
    (media (mediasAlunos lista))
)

(defun mediasAlunos (lista)
    (if (null lista)
        ()
        (cons (getMedia (car lista)) (mediasAlunos (cdr lista))))
)

; Crie uma função com o seguinte nome: aprovados, a qual recebe uma lista de alunos e retorna uma
; lista com o nome dos alunos aprovados. Um aluno está aprovado se a sua média é maior ou igual a
; 6.

(defun aprovados (lista)
    (if (null lista)
        ()
        (if (aprovado (car lista))
            (cons (getNome (car lista)) (aprovados (cdr lista)))
            (aprovados (cdr lista))))
)

(defun aprovado (aluno) (>= (getMedia aluno) 6))

; Crie uma função com o seguinte nome: duplas, a qual recebe uma lista de alunos e retorna uma lista
; de duplas de alunos. Note que um aluno não pode fazer dupla consigo mesmo.

(defun duplas (lista)
    (if (or (null lista) (null (cdr lista)))
        ()
        (cons (getDuplas (car lista) (cdr lista)) (duplas (cdr lista))))
)

(defun getDuplas (aluno lista)
    (if (null lista)
        ()
        (cons (cons (getNome aluno) (getNome (car lista))) (getDuplas aluno (cdr lista))))
)

; Crie uma função com o seguinte nome: ordernarAlunos, a qual recebe uma lista de alunos e retorna
; os nomes e médias dos alunos ordenados em ordem crescente de média.

(defun ordernarAlunos (lista)
    (getNomes (ordernarAlunosPorMedia lista))
)

(defun ordernarAlunosPorMedia (lista)
    (if (null lista)
        ()
        (adiciona (car lista) (ordernarAlunosPorMedia (cdr lista))))
)

(defun adiciona (aluno lista)
    (if (null lista)
        (list aluno)
        (if (<= (getMedia aluno) (getMedia (car lista)))
            (cons aluno lista)
            (cons (car lista) (adiciona aluno (cdr lista)))))
)

(defun main ()
    (write-line (write-to-string (getNomes (alunos))))
    (write-line (write-to-string (medias (alunos))))
    (write-line (write-to-string (mediaTurma (alunos))))
    (write-line (write-to-string (aprovados (alunos))))
    (write-line (write-to-string (duplas (alunos))))
    (write-line (write-to-string (ordernarAlunos (alunos))))
)

(main)
