/*
20. Crie uma regra primo(N) que receba um número N e retorne se o mesmo é primo.
*/

primo(N) :- N > 1, N1 is N - 1, primoR(N, N1).

primoR(N, 1).
primoR(N, N1) :- not(0 is mod(N, N1)), N2 is N1 - 1, primoR(N, N2), !.

/*
?- primo(1).
false.

?- primo(2).
true .

?- primo(3).
true.

?- primo(4).
false.

?- primo(5).
true.

?- primo(6).
false.

?- primo(7).
true.

?- primo(8).
false.

?- primo(9).
false.

?- primo(10).
false.
*/
