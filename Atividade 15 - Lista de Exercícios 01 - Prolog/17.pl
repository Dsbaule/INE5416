/*
17. Crie uma regra mmc(X,Y,Resultado) que receba dois numeros X e Y e retorne o mnimo multiplo comum
(DICA: use a regra do maximo divisor comum ja criada).
*/

mdc(X,Y,Resultado) :- Resultado is mod(X, Y), mod(Y,Resultado) =:= 0.
mdc(X,Y,Resultado) :- R is mod(X, Y), mdc(Y,R,Resultado).

mmc(X,Y,Resultado) :- mdc(X,Y,MDC), Resultado is (Y * (X/MDC)).

/*
?- mmc(3,4,X).
X = 12 .

?- mmc(5,12,X).
X = 60 .
*/
