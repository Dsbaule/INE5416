/*
8. Crie uma regra areaTriangulo(B,A,Area) que receba a base e a altura de um tri^angulo e calcule a area
do mesmo.
*/

areaTriangulo(B,A,Area) :- Area is (B * A)/2.

/*
?- areaTriangulo(2,2,X).
X = 2.

?- areaTriangulo(2,3,X).
X = 3.

?- areaTriangulo(3,3,X).
X = 4.5.
*/
