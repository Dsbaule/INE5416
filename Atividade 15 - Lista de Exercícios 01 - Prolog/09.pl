/*
9. Crie uma regra xor(X,Y) que receba dois valores booleanos X e Y e indique se a operac~ao X xor Y e
verdadeira. Construa a regra apenas usando os operadores , (and), ; (or) e not.
*/

xor(X,Y) :- (X ; Y) , not((X , Y)).

/*
?- xor(false, false).
false.

?- xor(false, true).
true.

?- xor(true, false).
true .

?- xor(true, true).
false
*/
