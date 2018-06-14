/*
2. (1.5) Crie uma regra repetidos(L1,L2), a qual recebe uma lista L1 como entrada e deve devolver uma
lista L2 com apenas os elementos que aparecem mais de uma vez em L1, conforme exemplo abaixo. Não
utilize nenhuma função pronta to Prolog para esta tarefa.
?- repetidos([1,2,3,2,1,1,1,2,2,4,5,3],L).
L = [3, 1, 2].
?- repetidos([1,2,3,4,5],L).
L = [].
*/

repetidos(L1,L2) :- achaRepetidos(L1,[],_,[],R), eliminaDuplicados(R, L2).

% achaRepetidos(L1,L2,L3,L4) - L1 eh a lista de elementos nao verificados, L2 eh a lista de elementos que apareceram uma vez ate agora,
% L3 sera a nova lista de elementos que apareceram uma vez, L4 eh a lista de elementos repetidos ate agora, L5 a nova lista de elementos
% repetidos.
achaRepetidos([], L2, L2, L4, L4) :- !.
achaRepetidos([X], [], [X], L4, L4) :- !.
achaRepetidos([X], [X|T], T, L4, [X|L4]) :- !.
achaRepetidos([X], [Y|T], [Y|T2], L4, L5) :- T \== X, achaRepetidos([X], T, T2, L4, L5), !.
achaRepetidos([H|T], L2, L3, L4, L5) :- achaRepetidos(T, L2, L3T, L4, L5T), achaRepetidos([H], L3T, L3, L5T, L5), !.

% Insere em uma lista sem duplicar elementos.
insereSemRepetir(X,[],[X]) :- !.
insereSemRepetir(X,[H|T],[H|L]) :- X \== H, insereSemRepetir(X,T,L), !.
insereSemRepetir(X,[X|T],[X|T]) :- !.

% Elimina os elementos que se repetem mais de uma vez
eliminaDuplicados([], []) :- !.
eliminaDuplicados([H|T], L) :- eliminaDuplicados(T, L1), insereSemRepetir(H, L1, L), !.

/* Testes

?- repetidos([1,1,1,1,12,3,4,3],X).
X = [3, 1] .

?- repetidos([1,1,1,1,12,3,4,3,12],X).
X = [3, 12, 1] .

?- repetidos([1,12,4,3],X).
X = [] .

?- repetidos([1,2,3,4,5],L).
L = [].

?- repetidos([1,2,3,2,1,1,1,2,2,4,5,3],L).
L = [2, 1, 3].

*/
