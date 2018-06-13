/*
12. Crie uma regra apagar(N,L1,L2), a qual recebe, um número de elementos N, uma lista L1, e retorna uma
lista L2. Esta função deve remover da lista os N primeiros elementos fornecidos como parâmetro. Não
utilize nenhuma função pronta to Prolog para esta tarefa.
*/

apagar(_, [], []).
apagar(X, [X|T], L) :- apagar(X,T,L).
apagar(X, [H|T], [H|L]) :- X \== H, apagar(X,T,L).

/*
?- apagar(1,[1,2,1,3,1,3,1,2,3],X).
X = [2, 3, 3, 2, 3] .
*/
