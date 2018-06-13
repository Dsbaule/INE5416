/*
6. Crie uma regra menor(L,X), a qual recebe uma lista L de inteiros e retorna o menor elemento X da lista.
Retorne 0 caso a lista for vazia. Não utilize nenhuma função pronta to Prolog para esta tarefa.
*/

menor([X], X).
menor([H|T],H) :- menor(T, MT), H < MT.
menor([H|T],MT) :- menor(T, MT), H >= MT.

/*
?- menor([1,2,3,4],X).
X = 1 .

?- menor([4,3,2],X).
X = 2 .
*/
