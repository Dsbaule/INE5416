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
descendente(X,Y) :- genitor(Y,Z), descendente(Z,Y). %recursão - passo recursivo

feliz(X) :- genitor(X,_).
