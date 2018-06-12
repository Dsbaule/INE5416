/*
7. Crie uma regra absoluto(N,X) que receba um numero N, negativo ou positivo,
e retorne seu valor absoluto X.
*/

absoluto(N, N) :- N >= 0.
absoluto(N, N2) :- N < 0, N2 is - N.

/*
?- absoluto(1, X).
X = 1 .

?- absoluto(3, X).
X = 3 .

?- absoluto(-1, X).
X = 1.

?- absoluto(-3, X).
X = 3.
*/
