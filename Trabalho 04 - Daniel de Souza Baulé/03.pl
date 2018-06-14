/*
3. (2.0) Crie uma regra rotacionarDireita(L1, N, L2), a qual recebe uma lista L1 e um inteiro N como
entrada e deve devolver uma lista L2 rotacionada à direita N vezes. Veja o exemplo abaixo. Não utilize
nenhuma função pronta to Prolog para esta tarefa.
?- rotacionarDireita([1,2,3,4,5,6,7],1,L).
L = [7, 1, 2, 3, 4, 5, 6].
?- rotacionarDireita([1,2,3,4,5,6,7],2,L).
L = [6, 7, 1, 2, 3, 4, 5].
*/

rotacionarDireita([], _, []) :- !.
rotacionarDireita([X], _, [X]) :- !.
rotacionarDireita(L, 0, L) :- !.
rotacionarDireita(L1, N, L2) :- rotacaoDireita(L1, NL), N1 is N - 1, rotacionarDireita(NL, N1, L2).

rotacaoDireita([], []).
rotacaoDireita([X], [X]).
rotacaoDireita([H1,H2|T], [HT,H1|T1]) :- rotacaoDireita([H2|T],[HT|T1]).

/* Testes
    ?- rotacionarDireita([1,2,3,4,5,6,7],2,L).
    L = [6, 7, 1, 2, 3, 4, 5] .

    ?- rotacionarDireita([1,2,3,4,5,6,7],1,L).
    L = [7, 1, 2, 3, 4, 5, 6] .

    ?- rotacionarDireita([1,2,3,4,5,6,7],4,L).
    L = [4, 5, 6, 7, 1, 2, 3] .
*/
