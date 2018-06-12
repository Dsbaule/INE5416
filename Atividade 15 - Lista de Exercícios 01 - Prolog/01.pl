/*
1. Modique o arquivo familia.pl (disponvel no Moodle) de forma a incluir as seguintes regras:
 tio(X,Y), onde X e o tio de Y.
 tia(X,Y), onde X e a tia de Y.
 primo(X,Y), onde X e o primo de Y.
 prima(X,Y), onde X e a prima de Y.
 primos(X,Y), onde X e primo ou prima de Y.
 bisavo(X,Y), onde X e o bisav^o de Y.
 bisavoh(X,Y), onde X e a bisavo de Y.
 descendente(X,Y), onde X e descendente de Y.
 feliz(X), onde X e feliz se possuilhos.
 Faca consultas para testar seu programa. Inclua no seu codigo fonte as consultas realizadas e o
resultado obtido (em comentario).
 Crie outra regra a sua escolha, descreva seu funcionamento e exemplique seu uso por meio de uma
consulta.
*/
genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).

genitor(liz,bill).

genitor(pat, jim).

mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).

homem(tom).
homem(bob).
homem(jim).
homem(bill).

pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

tio(X,Y) :- genitor(W,Y), irmao(X, W).
tia(X,Y) :- genitor(W,Y), irma(X, W).

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), homem(AvohX).

bizavo(BizavoX, X) :- genitor(GenitorX, X), avo(BizavoX, GenitorX).
bizavoh(BizavohX, X) :- genitor(GenitorX, X), avoh(BizavohX, GenitorX).

irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

primos(X,Y) :- genitor(W,X), genitor(Z,Y), irmaos(W,Z).
prima(X, Y) :- primos(X,Y), mulher(X).
primo(X, Y) :- primos(X,Y), homem(X).

ascendente(X,Y) :- genitor(X,Y). %recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). %recursão - passo recursivo

descendente(X,Y) :- genitor(Y,X). %recursão - caso base
descendente(X,Y) :- genitor(Y,Z), descendente(X,Z). %recursão - passo recursivo

feliz(X) :- genitor(X,_).
