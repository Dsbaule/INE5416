/*
2. Crie uma solução para o problema das X-rainhas num tabuleiro de Xadrez NxN. O problema consiste em
descobrir quais posições devo colocar as X rainhas num tabuleiro de Xadrez de dimensões NxN de modo
que nenhuma possa atacar outra. Caso não for possı́vel colocar as X rainhas, então deve-se retornar que a
solução é impossı́vel e o tabuleiro deve estar em branco. Para facilitar (se preferir), assuma que o tabuleiro
sempre possui dimensões 8x8 e o número de rainhas é 8. Comente seu código e faça uma consulta para
ilustrar. Adicione a consulta e o resultado no código fonte (em comentário).
*/

casa(0) % casa vazia
casa(1) % rainha

posiciona([],[]).
posiciona([X|T]) :- casa(X), posiciona(T), sum_list([X|T], 1).
/*
posiciona([X11, X12, X13, X14, X15, X16, X17, X18]) :-
    casa(X11), casa(X12), casa(X13), casa(X14), casa(X15), casa(X16), casa(X17), casa(X18),
    sum_list([X11, X12, X13, X14, X15, X16, X17, X18], N), N <= 1.
*/
checaRainha(X) :- sum_list(X, 0).
checaRainha(X) :- sum_list(X, 1).

contaRainhas([], 0).
contaRainhas([X|T], S) :- contaRainhas(T, Y), S is X + Y.
contaRainhas([[X|T]|T2], S) :- contaRainhas(T2, Y1), contaRainhas([X|T], Y2), S is Y1 + Y2.

solucao(Tabuleiro) :-

    Tabuleiro = [
        [X11, X12, X13, X14, X15, X16, X17, X18],
        [X21, X22, X23, X24, X25, X26, X27, X28],
        [X31, X32, X33, X34, X35, X36, X37, X38],
        [X41, X42, X43, X44, X45, X46, X47, X48],
        [X51, X52, X53, X54, X55, X56, X57, X58],
        [X61, X62, X63, X64, X65, X66, X67, X68],
        [X71, X72, X73, X74, X75, X76, X77, X78],
        [X81, X82, X83, X84, X85, X86, X87, X88],
    ],

    % LINHAS
    posiciona([X11, X12, X13, X14, X15, X16, X17, X18]),
    posiciona([X21, X22, X23, X24, X25, X26, X27, X28]),
    posiciona([X31, X32, X33, X34, X35, X36, X37, X38]),
    posiciona([X41, X42, X43, X44, X45, X46, X47, X48]),
    posiciona([X51, X52, X53, X54, X55, X56, X57, X58]),
    posiciona([X61, X62, X63, X64, X65, X66, X67, X68]),
    posiciona([X71, X72, X73, X74, X75, X76, X77, X78]),
    posiciona([X81, X82, X83, X84, X85, X86, X87, X88]),

    % COLUNAS
    posiciona([X11, X21, X31, X41, X51, X61, X71, X81]),
    posiciona([X12, X22, X32, X42, X52, X62, X72, X82]),
    posiciona([X13, X23, X33, X43, X53, X63, X73, X83]),
    posiciona([X14, X24, X34, X44, X54, X64, X74, X84]),
    posiciona([X15, X25, X35, X45, X55, X65, X75, X85]),
    posiciona([X16, X26, X36, X46, X56, X66, X76, X86]),
    posiciona([X17, X27, X37, X47, X57, X67, X77, X87]),
    posiciona([X18, X28, X38, X48, X58, X68, X78, X88]),

    % DIAGONAIS
    posiciona([X17, X27]),
    posiciona([X16, X27, X37]),
    posiciona([X15, X26, X37, X48]),
    posiciona([X14, X25, X36, X47, X58]),
    posiciona([X13, X24, X35, X46, X57, X68]),
    posiciona([X12, X23, X34, X45, X56, X67, X78]),
    posiciona([X11, X22, X33, X44, X55, X66, X77, X88]).
    posiciona([X21, X32, X43, X54, X65, X76, X87]),
    posiciona([]),
    posiciona([]),
    posiciona([]),
    posiciona([]),
    posiciona([]),
    posiciona([]),
