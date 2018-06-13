/*
8. Crie uma regra diferencaMaiorMenor(L,X), a qual recebe uma lista L de inteiros e retorna a diferença
entre o maior e o menor elemento X da lista. Retorne 0 caso a lista for vazia. Não utilize nenhuma
função pronta to Prolog para esta tarefa.
*/

diferencaMaiorMenor([],0).
diferencaMaiorMenor(L,X) :- maiorElemento(L,Maior), menorElemento(L,Menor), X is Maior - Menor.

maiorElemento([X], X).
maiorElemento([H|T],H) :- maiorElemento(T, MT), H >= MT.
maiorElemento([H|T],MT) :- maiorElemento(T, MT), H < MT.

menorElemento([X], X).
menorElemento([H|T],H) :- menorElemento(T, MT), H < MT.
menorElemento([H|T],MT) :- menorElemento(T, MT), H >= MT.

/*
?- diferencaMaiorMenor([1,2,3,4,5,6,7,8],X).
X = 7 .

?- diferencaMaiorMenor([5,3,3,4,5,6,7,8],X).
X = 5 .
*/
