/*
12. Crie uma regra distancia3D(ponto(X1,Y1,Z1),ponto(X2,Y2,Z2), Dist) que dados dois pontos no espaco
3D, (x1, y1, z1) e (x2, y2, z2), compute a dist^ancia (Dist) entre eles.
*/

distancia3D(ponto(X1,Y1,Z1),ponto(X2,Y2,Z2), Dist) :- Dist is sqrt(((X1 - X2) * (X1 - X2)) + ((Y1 - Y2) * (Y1 - Y2)) + ((Z1 - Z2) * (Z1 - Z2))).

/*
?- distancia3D(ponto(0,0,0),ponto(1,0,0), X).
X = 1.0.

?- distancia3D(ponto(0,0,0),ponto(1,1,0), X).
X = 1.4142135623730951.

?- distancia3D(ponto(0,0,0),ponto(2,2,0), X).
X = 2.8284271247461903.

?- distancia3D(ponto(4,-8,9),ponto(2,-3,5), X).
X = 6.708203932499369.
*/
