/*
11. Crie uma regra fib(N,K) que compute o N-esimo numero de Fibonacci K.
*/

fib(0, 1).
fib(1, 1).
fib(N, K) :- N1 is N - 1, fib(N1, K1), N2 is N - 2, fib(N2, K2), K is K1 + K2.

/*
?- fib(0,X).
X = 1 .

?- fib(1,X).
X = 1 .

?- fib(2,X).
X = 2 .

?- fib(3,X).
X = 3 .

?- fib(4,X).
X = 5 .

?- fib(5,X).
X = 8 .
*/
