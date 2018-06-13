/*
5. Crie uma regra media(L,X), a qual recebe uma lista L de inteiros e retorna a média de todos os elementos
X da lista. Retorne 0 caso a lista for vazia. Não utilize nenhuma função pronta to Prolog para esta
tarefa.
*/

media([],0).
media([H|T],X) :- mediar([H|T],S,C), X is S/C.

mediar([], 0, 0).
mediar([H|T],S,C) :- mediar(T,ST,CT), S is H + ST, C is 1 + CT.

/*
?- media([1,2,3],X).
X = 2.

?- media([1,2,3.5],X).
X = 2.1666666666666665.

?- media([12,24,36],X).
X = 24.
*/
