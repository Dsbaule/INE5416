/*
15. Crie uma regra mdc(X,Y,Resultado) que receba dois numeros X e Y e retorne o maximo divisor comum
(DICA: pesquise sobre o Algoritmo de Euclides).
*/

mdc(X,Y,Resultado) :- Resultado is mod(X, Y), mod(Y,Resultado) =:= 0.
mdc(X,Y,Resultado) :- R is mod(X, Y), mdc(Y,R,Resultado).

/*
?- mdc(4,6,X).
X = 2 .

?- mdc(4,8,X).
X = 4 .

?- mdc(23732,180,X).
X = 4 .
*/
