/*
6. Crie uma regra potencia(X,Y,Resultado), onde Resultado e XY .
*/

potencia(X,0,1).
potencia(X,1,X).
potencia(X,Y,Resultado) :- Y1 is Y - 1, potencia(X, Y1, Resultado1), Resultado is X * Resultado1.

/*
?- potencia(2,2,X).
X = 4 .

?- potencia(2,3,X).
X = 8 .

?- potencia(2,4,X).
X = 16 .

?- potencia(3,4,X).
X = 81 .
*/
