/*
14. Crie uma regra operacao(Op,X,Y,Resultado) que receba tr^es par^ametros Operador, X e Y, e retorne o
resultado da operac~ao matematica X Operador Y . Os operadores possveis de informar s~ao +, -, *, /.
*/

operacao(+,X,Y,Resultado) :- Resultado is X + Y.
operacao(-,X,Y,Resultado) :- Resultado is X - Y.
operacao(*,X,Y,Resultado) :- Resultado is X * Y.
operacao(/,X,Y,Resultado) :- Resultado is X / Y.

/*
?- operacao(+,2,3,X).
X = 5.

?- operacao(-,2,3,X).
X = -1.

?- operacao(*,2,3,X).
X = 6.

?- operacao(/,2,3,X).
X = 0.6666666666666666.
*/
