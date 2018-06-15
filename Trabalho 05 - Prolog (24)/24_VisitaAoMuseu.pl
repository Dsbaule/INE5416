bolsa(amarela).
bolsa(azul).
bolsa(branca).
bolsa(verde).
bolsa(vermelha).

nome(adriana).
nome(cecilia).
nome(iara).
nome(poliana).
nome(sabrina).

idade(20).
idade(28).
idade(33).
idade(45).
idade(56).

pintor(brasileiro).
pintor(espanhol).
pintor(frances).
pintor(holandes).
pintor(italiano).

chegada('9:00').
chegada('9:30').
chegada('10:00').
chegada('10:30').
chegada('11:00').

transporte(bicicleta).
transporte(carro).
transporte(metro).
transporte(onibus).
transporte(trem).

% X está entre Y e Z (em qualquer posição no meio)
entre(X,Y,Z,Lista) :- aEsquerda(X,Z,Lista), aDireita(X,Y,Lista).

% X está à esquerda de Y (em qualquer posição à esquerda)
aEsquerda(X,Y,Lista) :- nth0(IndexX,Lista,X),
                        nth0(IndexY,Lista,Y),
                        IndexX < IndexY.

% X está à direita de Y (em qualquer posição à direita)
aDireita(X,Y,Lista) :- aEsquerda(Y,X,Lista).

%X está à ao lado de Y
aoLado(X,Y,Lista) :- nextto(X,Y,Lista);nextto(Y,X,Lista).

%X está no canto se ele é o primeiro ou o último da lista
noCanto(X,Lista) :- last(Lista,X).
noCanto(X,[X|_]).

% Verifica se X esta na 1a posição
primeira(X,[X|_]).

% Verifica se todos os elementos da lista sao diferentes
todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H,T)), todosDiferentes(T).

solucao(ListaSolucao) :-

    ListaSolucao = [
        visitante(Bolsa1, Nome1, Idade1, Pintor1, Chegada1, Transporte1),
        visitante(Bolsa2, Nome2, Idade2, Pintor2, Chegada2, Transporte2),
        visitante(Bolsa3, Nome3, Idade3, Pintor3, Chegada3, Transporte3),
        visitante(Bolsa4, Nome4, Idade4, Pintor4, Chegada4, Transporte4),
        visitante(Bolsa5, Nome5, Idade5, Pintor5, Chegada5, Transporte5)
    ],

    % Sabrina está em algum lugar entre a dona da bolsa Amarela e a visitante que gosta do pintor Francês, nessa ordem.
    entre(visitante(_,sabrina,_,_,_,_), visitante(amarela,_,_,_,_,_), visitante(_,_,_,frances,_,_), ListaSolucao),

    % Na primeira posição está quem foi de Trem.
    primeira(visitante(_,_,_,_,_,trem), ListaSolucao),

    % A visitante mais velha está em algum lugar à direita da visitante da bolsa Azul.
    aDireita(visitante(_,_,56,_,_,_), visitante(azul,_,_,_,_,_), ListaSolucao),

    % A mulher que chegou às 10:00 está ao lado da visitante que gosta do pintor Brasileiro.
    aoLado(visitante(_,_,_,_,'10:00',_), visitante(_,_,_,brasileiro,_,_), ListaSolucao),

    % A visitante de 28 anos está em algum lugar entre a dona da bolsa Branca e a mulher mais nova, nessa ordem.
    entre(visitante(_,_,28,_,_,_), visitante(branca,_,_,_,_,_), visitante(_,_,20,_,_,_), ListaSolucao),

    % A dona da bolsa Azul está em algum lugar à esquerda de quem chegou às 10:30.
    aEsquerda(visitante(azul,_,_,_,_,_), visitante(_,_,_,_,'10:30',_), ListaSolucao),

    % Quem foi de Metrô está ao lado de quem gosta do pintor Brasileiro.
    aoLado(visitante(_,_,_,_,_,metro), visitante(_,_,_,brasileiro,_,_), ListaSolucao),

    % Adriana está ao lado de quem foi de Bicicleta.
    aoLado(visitante(_,_,_,_,_,bicicleta), visitante(_,adriana,_,_,_,_), ListaSolucao),

    % Cecília está em uma das pontas.
    noCanto(visitante(_,cecilia,_,_,_,_), ListaSolucao),

    % A visitante que gosta do pintor Brasileiro está em algum lugar entre a mulher de 45 anos e a mulher que gosta do pintor Italiano, nessa ordem.
    entre(visitante(_,_,_,brasileiro,_,_), visitante(_,_,45,_,_,_), visitante(_,_,_,italiano,_,_), ListaSolucao),

    % A mulher de 33 anos está ao lado da mulher que foi de Ônibus para a exposição.
    aoLado(visitante(_,_,33,_,_,_), visitante(_,_,_,_,_,onibus), ListaSolucao),

    % A visitante da bolsa Verde gosta do pintor Francês.
    member(visitante(verde,_,_,frances,_,_), ListaSolucao),

    % Quem foi de Carro está ao lado de quem chegou às 10:00.
    aoLado(visitante(_,_,_,_,_,carro), visitante(_,_,_,_,'10:00',_), ListaSolucao),

    % Poliana está em algum lugar à direita da mulher de bolsa Azul.
    aDireita(visitante(_,poliana,_,_,_,_), visitante(azul,_,_,_,_,_), ListaSolucao),

    % Quem foi de Bicicleta está em algum lugar entre quem foi de Metrô e quem foi de Ônibus, nessa ordem.
    entre(visitante(_,_,_,_,_,bicicleta), visitante(_,_,_,_,_,metro), visitante(_,_,_,_,_,onibus), ListaSolucao),

    % A visitante que chegou mais cedo está ao lado da visitante de bolsa Vermelha.
    aoLado(visitante(_,_,_,_,'9:00',_), visitante(vermelha,_,_,_,_,_), ListaSolucao),

    % Iara está ao lado da mulher de bolsa Azul.
    aoLado(visitante(_,iara,_,_,_,_), visitante(azul,_,_,_,_,_), ListaSolucao),

    % A visitante que foi de Bicicleta está exatamente à esquerda da visitante de bolsa Verde.
    aoLado(visitante(_,_,_,_,_,bicicleta), visitante(verde,_,_,_,_,_), ListaSolucao),
    aEsquerda(visitante(_,_,_,_,_,bicicleta), visitante(verde,_,_,_,_,_), ListaSolucao),

    % A visitante que gosta do pintor Francês está ao lado de Sabrina.
    aoLado(visitante(_,_,_,frances,_,_), visitante(_,sabrina,_,_,_,_), ListaSolucao),

    % Quem gosta do pintor Espanhol está ao lado de quem chegou às 9:00.
    aoLado(visitante(_,_,_,espanhol,_,_), visitante(_,_,_,_,'9:00',_), ListaSolucao),

    % A dona da bolsa Vermelha gosta do pintor Italiano.
    member(visitante(vermelha,_,_,italiano,_,_), ListaSolucao),

    % Quem chegou às 9:30 está entre quem foi de Trem e quem chegou às 9:00, nessa ordem.
    entre(visitante(_,_,_,_,'9:30',_), visitante(_,_,_,_,_,trem), visitante(_,_,_,_,'9:00',_), ListaSolucao),

    % A visitante de bolsa Branca está ao lado da visitante que foi de Metrô.
    aoLado(visitante(branca,_,_,_,_,_), visitante(_,_,_,_,_,metro), ListaSolucao),

    % Testa todas as possibilidades...
    bolsa(Bolsa1), bolsa(Bolsa2), bolsa(Bolsa3), bolsa(Bolsa4), bolsa(Bolsa5),
    todosDiferentes([Bolsa1, Bolsa2, Bolsa3, Bolsa4, Bolsa5]),

    nome(Nome1), nome(Nome2), nome(Nome3), nome(Nome4), nome(Nome5),
    todosDiferentes([Nome1, Nome2, Nome3, Nome4, Nome5]),

    idade(Idade1), idade(Idade2), idade(Idade3), idade(Idade4), idade(Idade5),
    todosDiferentes([Idade1, Idade2, Idade3, Idade4, Idade5]),

    pintor(Pintor1), pintor(Pintor2), pintor(Pintor3), pintor(Pintor4), pintor(Pintor5),
    todosDiferentes([Pintor1, Pintor2, Pintor3, Pintor4, Pintor5]),

    chegada(Chegada1), chegada(Chegada2), chegada(Chegada3), chegada(Chegada4), chegada(Chegada5),
    todosDiferentes([Chegada1, Chegada2, Chegada3, Chegada4, Chegada5]),

    transporte(Transporte1), transporte(Transporte2), transporte(Transporte3), transporte(Transporte4), transporte(Transporte5),
    todosDiferentes([Transporte1, Transporte2, Transporte3, Transporte4, Transporte5]).

/*
    Respostas Obtidas:

    ?- solucao(X).
    X = [ visitante(branca, cecilia, 45, holandes, '11:00', trem),
          visitante(amarela, iara, 28, espanhol, '9:30', metro),
          visitante(azul, adriana, 20, brasileiro, '9:00', carro),
          visitante(vermelha, sabrina, 33, italiano, '10:00', bicicleta),
          visitante(verde, poliana, 56, frances, '10:30', onibus)] ;
    false.

    Testando no site, resposta correta.

*/
