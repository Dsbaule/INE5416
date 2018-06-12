/*
3. Crie uma regra divisivel(N,K) para dizer se um numero N e divisvel por K.
*/

divisivel(N,K) :- 0 is mod(N, K).

/*
?- divisivel(2,3).
false.

?- divisivel(6,3).
true.
*/
