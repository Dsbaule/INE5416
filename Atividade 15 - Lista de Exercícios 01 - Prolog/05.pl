/*
5. Crie uma regra eqSegundoGrau(A,B,C,ValorX) que resolva uma equac~ao de segundo grau da forma
ax2 + bx + c utilizando a formula de Bhaskara.
*/

eqSegundoGrau(A,B,C,ValorX) :- eqSegundoGrauP(A,B,C,ValorX); eqSegundoGrauN(A,B,C,ValorX).

eqSegundoGrauP(A,B,C,ValorX) :- ValorX is ((- B) + sqrt(B * B - 4 * A * C)) / (2 * A).
eqSegundoGrauN(A,B,C,ValorX) :- ValorX is ((- B) - sqrt(B * B - 4 * A * C)) / (2 * A).

/*
?- eqSegundoGrau(1,-5,6,X).
X = 3.0 ;
X = 2.0.
*/
