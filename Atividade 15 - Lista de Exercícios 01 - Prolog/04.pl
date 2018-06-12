/*
4. Crie uma regra triangulo(X,Y,Z) que receba tr^es valores X, Y e Z e indique se havendo varetas com
esses valores em comprimento pode-se construir um tri^angulo. Exemplo, com varetas de comprimento 4,
8 e 9 posso construir um tri^angulo, porem com varetas de comprimento 10, 5 e 4 n~ao posso construir um
tri^angulo.
*/

triangulo(X, Y, Z) :-
  X < Y + Z,
  Y < X + Z,
  Z < X + Y,
  X > abs(Y - Z),
  Y > abs(X - Z),
  Z > abs(X - Y).

/*
?- triangulo(4,8,9).
true.

?- triangulo(10,5,4).
false.
*/
