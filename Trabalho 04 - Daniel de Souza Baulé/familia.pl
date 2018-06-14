genitor(fred, maria).
genitor(pam, bob).
genitor(tom, bob).
genitor(pam, liz).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).
genitor(bia, ana).
genitor(bia, pat).

genitor(liz,bill).
genitor(trump,bill).

genitor(mary,tim).
genitor(trump,tim).

genitor(pat, jim).
genitor(kim, jim).

mulher(maria).
mulher(pam).
mulher(bia).
mulher(liz).
mulher(mary).
mulher(ana).
mulher(pat).

homem(fred).
homem(tom).
homem(bob).
homem(trump).
homem(kim).
homem(bill).
homem(tim).
homem(jim).

idade(fred, 56).
idade(maria, 30).
idade(pam, 98).
idade(tom, 70).
idade(bob, 45).
idade(bia, 43).
idade(liz, 47).
idade(trump, 54).
idade(mary, 51).
idade(ana, 12).
idade(pat, 25).
idade(kim, 27).
idade(bill, 15).
idade(tim, 17).
idade(jim, 1).

/*
1. Altere o arquivo familia.pl disponı́vel juntamente com este enunciado. Assuma que nenhum nome de
pessoa é repetido, isto é, cada nome de pessoa no arquivo é um nome único (um identificador). Crie novas
pessoas e altere idades, se for necessário. Faça os itens abaixo:

    A (1.0): Crie uma regra casados(X,Y), onde a pessoa X é casada com a pessoa Y se elas possuem algum
    filho em comum. Note que nenhuma pessoa é casada com ela mesma.
*/
casados(X,Y) :- genitor(X,F), genitor(Y,F), X \== Y.

/*
B (1.0): Crie uma regra cunhados(X,Y), onde X é cunhado ou cunhada de Y.
*/

cunhados(X,Y) :- (casados(X,Z), irmaos(Y,Z));(casados(Y,Z), irmaos(X,Z)).
irmaos(X,Y) :- genitor(Z, X), genitor(Z, Y), X \== Y.

/*
C (1.0): Crie regras sobrinho(X,Y) e sobrinha(X,Y), onde X é sobrinho ou sobrinha de Y, dependendo
da regra.
*/

sobrinho(X,Y) :- genitor(Z,X), genitor(G,Z), genitor(G,Y), Z \== Y, homem(X).
sobrinha(X,Y) :- genitor(Z,X), genitor(G,Z), genitor(G,Y), Z \== Y, mulher(X).

/*
D (1.0): Crie uma regra casadoMaisVezes(X), que deve retornar verdadeiro se X pode ter sido casado(a)
mais de uma vez, ou seja, possui filhos com diferentes pessoas.
*/

casadoMaisVezes(X) :- casados(X,Y), casados(X,Z), (Z \== Y).

/*
E (1.0): Crie uma consulta para retornar a lista ordenada (e sem repetições) de todos os avôs ou avós
com idade maior de 50 anos.
*/

% Funcoes auxiliares
avo(X,Y) :- genitor(X,Z), genitor(Z,Y).

% Consulta:
%    setof(X, Y ^ I ^ (avo(X,Y), idade(X,I), I > 50), Avos).

/*
F (1.0): Crie uma consulta para retornar a lista ordenada (e sem repetições) de todas as pessoas que não
são avôs ou avós e que possuem filhos com idade entre 30 (inclusive) e 90 (inclusive) anos.
*/

% Consulta:
%    setof(P, N ^ F ^ I ^ (genitor(P,F),not(genitor(F,N)),idade(F,I),I >= 30, I=<90), Pessoas).

/*
G (1.0): Crie uma consulta para retornar, para cada avô (masculino), a lista de seus descendentes, ou
seja, agrupe os descendentes por avô.
*/

% Funcoes auxiliares

descendente(X,Y) :- genitor(Y,X).
descendente(X,Y) :- genitor(Z,X), descendente(Z,Y).

% Consulta:
%   setof(D, N ^ (avo(V,N), descendente(D,V), homem(V)), Descendentes).

/*
Testes:

A.

    ?- casados(bob,bia).
    true .

    ?- casados(bob,ana).
    false.

    ?- casados(bob,bob).
    false.

B.

    ?- setof(C, cunhados(C,Pessoa), Cunhados).
    Pessoa = ana,
    Cunhados = [kim] ;
    Pessoa = bia,
    Cunhados = [liz] ;
    Pessoa = bob,
    Cunhados = [trump] ;
    Pessoa = kim,
    Cunhados = [ana] ;
    Pessoa = liz,
    Cunhados = [bia] ;
    Pessoa = trump,
    Cunhados = [bob].

C.

    ?- setof(S, sobrinha(S,Pessoa), Sobrinhas).
    Pessoa = liz,
    Sobrinhas = [ana, pat].

    ?- setof(S, sobrinho(S,Pessoa), Sobrinhos).
    Pessoa = ana,
    Sobrinhos = [jim] ;
    Pessoa = bob,
    Sobrinhos = [bill].

D.

    ?- setof(X, casadoMaisVezes(X), CasadosMaisVezes).
    CasadosMaisVezes = [trump].

F.

    ?- setof(P, N ^ F ^ I ^ (genitor(P,F),not(genitor(F,N)),idade(F,I),I >= 30, I=<90), Pessoas).
    Pessoas = [fred].

G.

    ?- setof(D, N ^ (avo(Avo,N), descendente(D,Avo), homem(Avo)), Descendentes).
    Avo = bob,
    Descendentes = [ana, jim, pat] ;
    Avo = tom,
    Descendentes = [ana, bill, bob, jim, liz, pat].

*/
