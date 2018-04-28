type Nome = String
type Disciplina = String
type Nota = Float
type Aluno = (Nome, Disciplina, Nota, Nota, Nota)

aluno :: Int -> Aluno
aluno a   | (a == 1) = ("Bob", "Haskell", 10, 10, 10)
          | (a == 2) = ("Tom", "LISP", 3.5, 6, 7)
          | (a == 3) = ("John", "html", 0.3, 0.2, 0.5)

getNome :: Aluno -> Nome
getNome (n, _, _, _, _) = n

getMedia :: Int -> Float
getMedia a = getMediaAluno (aluno a)

getMediaAluno :: Aluno -> Float
getMediaAluno (_, _, n1, n2, n3) = (n1 + n2 + n3)/3

getMediaTurma :: Int -> Float
getMediaTurma a | (a > 3) = 0
                | otherwise = ((getMedia a)/3) + getMediaTurma(a + 1)

main = do
  print (getMedia 1)
  print (getMedia 2)
  print (getMedia 3)
  print (getMediaTurma 1)
