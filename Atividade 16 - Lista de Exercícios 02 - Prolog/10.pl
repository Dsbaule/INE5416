/*
10. Crie uma regra inverte(L1,L2), a qual recebe uma lista L1 como parâmetro e deve retornar a mesma
invertida L2. Não utilize nenhuma função pronta do Prolog para realizar esta tarefa.
*/

inverte([],[]).
inverte([H|T], L) :- inverte(T,L2), insereNoFim(H, L2, L).

insereNoFim(X, [], [X]).
insereNoFim(X, [H|T], [H|L]) :- insereNoFim(X, T, L).

/*
?- inverte([1,2,3,4,5],X).
X = [5, 4, 3, 2, 1] .
*/
