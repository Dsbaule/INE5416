/*
9. Crie uma regra ocorrencias(L,X,N), a qual recebe uma lista L, um elemento X e retorna o número de
vezes N em que o elemento está presente na lista. Não utilize nenhuma função pronta to Prolog para
esta tarefa.
*/

ocorrencias([],_,0).
ocorrencias([X|T],X,N) :- ocorrencias(T,X,N2), N is N2 + 1.
ocorrencias([H|T],X,N) :- ocorrencias(T,X,N), H \== T.

/*
?- ocorrencias([1,2,3,2,2,1],1,X).
X = 2 .

?- ocorrencias([1,2,3,2,2,1],2,X).
X = 3 .

?- ocorrencias([1,2,3,2,2,1],3,X).
X = 1 .
*/
