/*
2. Crie um novo programa Prolog para o seguinte cenario.
 Crie fatos para representar as sentencas abaixo:
  { um estudante estuda uma disciplina, sendo que uma disciplina e formada por 3 letras e 4 dgitos
  (ex: ine5416).
  { um professor leciona uma disciplina.
 Crie regras que representem as sentencas abaixo:
  { Um professor ensina um aluno se o professor leciona uma disciplina em que o aluno estuda.
  { Dois estudantes s~ao colegas de classe se estudam a mesma disciplina e n~ao s~ao o mesmo aluno.
  { Crie consultas para as seguintes perguntas abaixo:
     Quais s~ao todas as disciplinas lecionadas pelo professor x? (substitua x por algum nome de
    professor no seu programa)
     Quais s~ao todos os alunos do professor x? (substitua x por algum nome de professor no seu
    programa)
     Quais s~ao todos os amigos do estudante y? (substitua y por algum nome de aluno no seu
    programa)
     a e b s~ao amigos? (substitua a e b por nomes de alunos no seu programa)
 Faca outras consultas para testar seu programa. Inclua no seu codigo fonte as consultas realizadas e
o resultado obtido (em comentario).
 Crie outra regra a sua escolha, descreva seu funcionamento e exemplique seu uso por meio de uma
consulta.
*/

disciplina(ine5416).
disciplina(ine5417).
disciplina(ine5410).

pessoa(daniel).
pessoa(edison).
pessoa(barichello).

pessoa(maicon).
pessoa(vilain).
pessoa(marcio).

estuda(daniel, ine5416).
estuda(edison, ine5416).
estuda(daniel, ine5417).
estuda(barichello, ine5417).
estuda(barichello, ine5410).

leciona(maicon, ine5416).
leciona(vilain, ine5417).
leciona(marcio, ine5410).

estudante(X) :- pessoa(X), estuda(X,Y), disciplina(Y).
professor(X) :- pessoa(X), leciona(X,Y), disciplina(Y).

ensina(X,Y) :- estuda(Y,Z), leciona(X,Z), disciplina(Z).

estudamJuntos(X, Y) :- estuda(X,Z), estuda(Y, Z), X \== Y.

% Verifica se 2 professores tem ao menos 1 aluno em comum
lecionamOMesmoAluno(X, Y) :- leciona(X, D1), leciona(Y, D2), estuda(E, D1), estuda(E, D2), X \== Y.

/*
Crie consultas para as seguintes perguntas abaixo:
 Quais s~ao todas as disciplinas lecionadas pelo professor x? (substitua x por algum nome de
professor no seu programa)

    leciona(maicon, X).
        X = ine5416.

 Quais s~ao todos os alunos do professor x? (substitua x por algum nome de professor no seu
programa)

    ensina(maicon, X).
        X = daniel ;
        X = edison ;
        false.

 Quais s~ao todos os amigos do estudante y? (substitua y por algum nome de aluno no seu
programa)

    estudamJuntos(daniel, X).
        X = edison ;
        X = barichello.

 a e b s~ao amigos? (substitua a e b por nomes de alunos no seu programa)

    estudamJuntos(daniel, edison).
        true.

    estudamJuntos(daniel, barichello).
        true.

    estudamJuntos(edison, barichello).
        false.

*/
