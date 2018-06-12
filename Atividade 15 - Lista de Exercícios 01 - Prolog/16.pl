/*
16. Crie uma regra mdc(X,Y,Z,Resultado) que receba tr^es numeros X, Y e Z e retorne o maximo divisor
comum (DICA: apenas modique a regra anterior).
*/

mdc2(X,Y,Resultado) :- Resultado is mod(X, Y), mod(Y,Resultado) =:= 0.
mdc2(X,Y,Resultado) :- R is mod(X, Y), mdc2(Y,R,Resultado).

mdc(X,Y,Z,Resultado) :- mdc2(X,Y,MDC1), mdc2(MDC1,Z,Resultado).

/*
?- mdc(6,9,12,X).
X = 3 .

?- mdc(8,12,16,X).
X = 4 .
*/
