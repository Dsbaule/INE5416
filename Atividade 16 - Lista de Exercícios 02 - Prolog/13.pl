/*
13. Crie uma regra dividir(L1,L2,L3), a qual recebe uma lista como entrada L1 e deve dividı́-la em duas
listas L2 e L3 com a mesma quantidade de elementos (exceto quando L1 tiver quantidade ı́mpar). Por
exemplo, dividir([1,2,3,4,5],L2,L3) deve retornar L2 = [1, 3, 5], L3 = [2, 4]. Não utilize nenhuma função
pronta to Prolog para esta tarefa.
*/

dividir([], [], []).
dividir([X], [X], []).
dividir([H1,H2|T], [H1|L1], [H2|L2]) :- dividir(T,L1,L2).

/*
?- dividir([1,2,3,4,5],X,Y).
X = [1, 3, 5],
Y = [2, 4] .

?- dividir([1,2,3,4,5,6],X,Y).
X = [1, 3, 5],
Y = [2, 4, 6].
*/
