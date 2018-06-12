/*
18. Crie uma regra coprimos(X,Y) que receba dois numeros X e Y e indique se eles s~ao coprimos. Dois
numeros s~ao ditos coprimos se o maximo divisor comum entre eles e 1.
*/

mdc(1,Y,1).
mdc(X,1,1).
mdc(X,X,X).
mdc(X,Y,Resultado) :- X > 1, Y > 1, X \== Y, Resultado is mod(X, Y), mod(Y,Resultado) =:= 0.
mdc(X,Y,Resultado) :- X > 1, Y > 1, X \== Y, R is mod(X, Y), mdc(Y,R,Resultado).

coprimos(X,Y) :- mdc(X,Y,1).

/*
?- coprimos(2,4).
false.

?- coprimos(3,4).
true .

?- coprimos(9,12).
false.

?- coprimos(9,13).
true .
*/
