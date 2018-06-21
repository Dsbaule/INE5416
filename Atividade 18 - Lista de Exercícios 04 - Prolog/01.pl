/* ----------------------------------------------------------------------------------------------------
1. Implemente um programa em Prolog para encontrar a solução para um dos problemas abaixo, assim como
demonstrado em sala de aula. Escolha qual problema implementar.
---------------------------------------------------------------------------------------------------- */

/* ----------------------------------------------------------------------------------------------------
  Problema A
---------------------------------------------------------------------------------------------------- */

touca(amarela).
touca(azul).
touca(branca).
touca(verde).

pais(brasil).
pais(china).
pais(eua).
pais(russia).

especialidade(borboleta).
especialidade(costas).
especialidade(crawl).
especialidade(peito).

medalhas(2).
medalhas(3).
medalhas(5).
medalhas(8).

suco(abacaxi).
suco(laranja).
suco(limao).
suco(maracuja).

idade(19).
idade(20).
idade(21).
idade(24).

% X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

% X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X),
                        nth0(IndexY,Lista,Y),
                        IndexX < IndexY.

% X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista).

%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).

% Verifica se todos os elementos da lista sao diferentes
todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

% Verifica se o nadador esta na posicao N da lista.
naPosicao(X,1,[X|_]) :- !.
naPosicao(X,N,[H|T]) :- N > 1, H \== X, N1 is N - 1, naPosicao(X,N1,T).

solucaoA(ListaSolucaoA) :-

    ListaSolucaoA = [
        nadador(Touca1, Pais1, Especialidade1, Medalhas1, Suco1, Idade1),
        nadador(Touca2, Pais2, Especialidade2, Medalhas2, Suco2, Idade2),
        nadador(Touca3, Pais3, Especialidade3, Medalhas3, Suco3, Idade3),
        nadador(Touca4, Pais4, Especialidade4, Medalhas4, Suco4, Idade4)
    ],

    % O nadador mais velho do grupo conquistou o maior número de medalhas.
    member(nadador(_,_,_,8,_,24), ListaSolucaoA),

    % Quem usa a touca Azul está em alguma raia à esquerda do nadador com 19 anos.
    aEsquerda(nadador(azul,_,_,_,_,_), nadador(_,_,_,_,_,19),ListaSolucaoA),

    % O nadador com 20 anos está em uma das raias das pontas.
    noCanto(nadador(_,_,_,_,_,20), ListaSolucaoA),

    % Quem gosta de beber limonada está exatamente à esquerda de quem é especialista em nado Crawl.
    aoLado(nadador(_,_,_,_,limao,_), nadador(_,_,crawl,_,_,_), ListaSolucaoA),
    aEsquerda(nadador(_,_,_,_,limao,_), nadador(_,_,crawl,_,_,_), ListaSolucaoA),

    % O atleta que bebe suco de Maracujá está em alguma raia à direita de quem usa a touca Azul.
    aDireita(nadador(_,_,_,_,maracuja,_), nadador(azul,_,_,_,_,_),ListaSolucaoA),

    % Na segunda raia está o nadador que bebe suco de Laranja.
    naPosicao(nadador(_,_,_,_,laranja,_),2,ListaSolucaoA),

    % O mais velho dos nadadores está na raia número 3.
    naPosicao(nadador(_,_,_,_,_,24),3,ListaSolucaoA),

    % Quem ganhou 3 medalhas está na segunda raia.
    naPosicao(nadador(_,_,_,3,_,_),2,ListaSolucaoA),

    % Quem ganhou 5 medalhas está posicionado exatamente à esquerda de quem gosta de suco de Laranja.
    aoLado(nadador(_,_,_,5,_,_), nadador(_,_,_,_,laranja,_), ListaSolucaoA),
    aEsquerda(nadador(_,_,_,5,_,_), nadador(_,_,_,_,laranja,_), ListaSolucaoA),

    % O especialista em nado Peito está na raia número 2.
    naPosicao(nadador(_,_,peito,_,_,_),2,ListaSolucaoA),

    % O especialista em nado Costas está exatamente à direita de quem conquistou 3 medalhas.
    aoLado(nadador(_,_,costas,_,_,_), nadador(_,_,_,3,_,_), ListaSolucaoA),
    aDireita(nadador(_,_,costas,_,_,_), nadador(_,_,_,3,_,_), ListaSolucaoA),

    % O Brasileiro conquistou o maior número de medalhas entre os 4 nadadores.
    member(nadador(_,brasil,_,8,_,_), ListaSolucaoA),

    % O nadador da China está exatamente à esquerda do nadador do Brasil.
    aoLado(nadador(_,china,_,_,_,_), nadador(_,brasil,_,_,_,_), ListaSolucaoA),
    aEsquerda(nadador(_,china,_,_,_,_), nadador(_,brasil,_,_,_,_), ListaSolucaoA),

    % O nadador dos EUA conquistou 5 medalhas.
    member(nadador(_,eua,_,5,_,_), ListaSolucaoA),

    % Na última raia está o nadador com a touca branca.
    naPosicao(nadador(branca,_,_,_,_,_),4,ListaSolucaoA),

    % O especialista em nado Borboleta está ao lado de quem usa a touca Azul.
    aoLado(nadador(_,_,borboleta,_,_,_), nadador(azul,_,_,_,_,_), ListaSolucaoA),

    % O nadador Estadunidense está usando a touca verde.
    member(nadador(verde,eua,_,_,_,_), ListaSolucaoA),

    % Testa todas as possibilidades
    touca(Touca1),touca(Touca2),touca(Touca3),touca(Touca4),
    todosDiferentes([Touca1,Touca2,Touca3,Touca4]),

    pais(Pais1),pais(Pais2),pais(Pais3),pais(Pais4),
    todosDiferentes([Pais1,Pais2,Pais3,Pais4]),

    especialidade(Especialidade1),especialidade(Especialidade2),especialidade(Especialidade3),especialidade(Especialidade4),
    todosDiferentes([Especialidade1,Especialidade2,Especialidade3,Especialidade4]),

    medalhas(Medalhas1),medalhas(Medalhas2),medalhas(Medalhas3),medalhas(Medalhas4),
    todosDiferentes([Medalhas1,Medalhas2,Medalhas3,Medalhas4]),

    suco(Suco1),suco(Suco2),suco(Suco3),suco(Suco4),
    todosDiferentes([Suco1,Suco2,Suco3,Suco4]),

    idade(Idade1),idade(Idade2),idade(Idade3),idade(Idade4),
    todosDiferentes([Idade1,Idade2,Idade3,Idade4]).

/* ----------------------------------------------------------------------------------------------------
  Problema B
---------------------------------------------------------------------------------------------------- */


/* ----------------------------------------------------------------------------------------------------
  Problema C
---------------------------------------------------------------------------------------------------- */
