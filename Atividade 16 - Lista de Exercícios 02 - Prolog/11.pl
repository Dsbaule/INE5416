/*
11. Crie uma regra primeiros(N,L1,L2), a qual recebe um número de elementos N, uma lista L1, e retorna
uma lista L2. Esta função deve retornar uma lista com os N primeiros elementos informados no primeiro
parâmetro. Não utilize nenhuma função pronta to Prolog para esta tarefa.
*/

primeiros(0,[_|_],[]) :- !.
primeiros(_,[],[]) :- !.
primeiros(N,[H|T],[H|L]) :- N > 0, N2 is N - 1, primeiros(N2, T, L).

/*
?- primeiros(3,[1,2,3,4,5],X).
X = [1, 2, 3].

?- primeiros(4,[1,2,3,4,5],X).
X = [1, 2, 3, 4].
*/
