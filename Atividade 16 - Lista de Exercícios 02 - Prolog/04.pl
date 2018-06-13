/*
4. Crie uma regra soma(L,X), a qual recebe uma lista L de inteiros e retorna a soma de todos os elementos X
da lista. Retorne 0 caso a lista for vazia. Não utilize nenhuma função pronta to Prolog para esta tarefa.
*/

soma([],0).
soma([H|T],X) :- soma(T,X2), X is H + X2.

/*
?- soma([],X).
X = 0.

?- soma([1,2],X).
X = 3.

?- soma([4,9,27],X).
X = 40.
*/
