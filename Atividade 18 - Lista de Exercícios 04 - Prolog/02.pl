/*
2. Crie uma solução para o problema das X-rainhas num tabuleiro de Xadrez NxN. O problema consiste em
descobrir quais posições devo colocar as X rainhas num tabuleiro de Xadrez de dimensões NxN de modo
que nenhuma possa atacar outra. Caso não for possı́vel colocar as X rainhas, então deve-se retornar que a
solução é impossı́vel e o tabuleiro deve estar em branco. Para facilitar (se preferir), assuma que o tabuleiro
sempre possui dimensões 8x8 e o número de rainhas é 8. Comente seu código e faça uma consulta para
ilustrar. Adicione a consulta e o resultado no código fonte (em comentário).
*/

casa(0). % casa vazia
casa(1). % rainha

rainha(1).
casaVazia(0).

geraTabuleiro(N, T) :- geraLinhas(N, N, T).

geraLinhas(_, 0, []) :- !.
geraLinhas(N, L, [H|T]) :- L1 is L - 1, geraLinhas(N, L1, T) , geraLinha(N, H).

geraLinha(0, []) :- !.
geraLinha(N, [H|T]) :- casa(H), N1 is N - 1, geraLinha(N1, T).

% Operação sobre o tabuleiro

getLinha(N,M,L) :- nth0(N,M,L).

getColuna(_,[],[]) :- !.
getColuna(N,[H|T],[H1|T1]) :- nth0(N,H,H1), getColuna(N,T,T1).

getCasa(NL,NC,M,X) :- getLinha(NL,M,L), nth0(NC,L,X).

numRainhas([],0) :- !.
numRainhas([H|T], X) :- sum_list(H,X1), numRainhas(T, X2), X is X1 + X2.

% Verificação do Tabuleiro:

checaLinhas(M) :- not((getLinha(_,M,L), sum_list(L,N), N > 1)).

checaColunas(M) :- not((getColuna(_,M,L), sum_list(L,N), N > 1)).

checaDiagonais(M) :-
    not((
        rainha(C1), rainha(C2),
        getCasa(NL1, NC1, M, C1),
        getCasa(NL2, NC2, M, C2),
        ((NL2 - NL1 =:= NC2 - NC1);(NL2 - NL1 =:= NC1 - NC2)),
        NL1 \== NL2,
        NC1 \== NC2
    )).

print_matrix([]).
print_matrix([H|T]) :- write(H), nl, print_matrix(T).

solucao() :-
    N is 8,
    tabuleiroValido(N,Tabuleiro),
    numRainhas(Tabuleiro,N),
    %obtemMelhorSolucao(N,N,Tabuleiro).
    print_matrix(Tabuleiro).

obtemMelhorSolucao(Natual,N,Tabuleiro) :-
    tabuleiroValido(N,Tabuleiro),
    numRainhas(Tabuleiro,Natual), !.
obtemMelhorSolucao(Natual,N,Tabuleiro) :- N1 is N - 1, obtemMelhorSolucao(Natual,N1,Tabuleiro).

tabuleiroValido(N, Tabuleiro) :-
    geraTabuleiro(N, Tabuleiro),
    checaLinhas(Tabuleiro),
    checaColunas(Tabuleiro),
    checaDiagonais(Tabuleiro),
    numRainhas(Tabuleiro,N).
