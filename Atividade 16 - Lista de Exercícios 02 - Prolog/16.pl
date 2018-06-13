/*
16. Crie regras para as operações de intersecção, união e diferença, mas que agora realizem a operação com
3 conjuntos e retornem o resultado no quarto conjunto. Não utilize nenhuma função pronta to Prolog
para esta tarefa.
*/

uniao(S1,S2,S3,S4) :- uniao2(S1,S2,SA), uniao2(SA,S3,S4).

uniao2([],L2,L2).
uniao2([H|T],L1,L) :- uniao2(T,L1,L2), insereSemRepetir(H,L2,L).

insereSemRepetir(X,[],[X]).
insereSemRepetir(X,[H|T],[H|L]) :- X \== H, insereSemRepetir(X,T,L).
insereSemRepetir(X,[X|T],[X|T]).

diferenca(S1,S2,S3,S4) :- diferenca2(S1,S2,SA), diferenca2(SA,S3,S4).

diferenca2(S1,[],S1) :- !.
diferenca2([],_,[]) :- !.
diferenca2(S1,[H,H1|T],S3) :- diferenca2(S1,[H1|T],S4), diferenca2(S4,[H],S3).
diferenca2([X|T],[X],S3) :- diferenca2(T,[X],S3).
diferenca2([H|T],[X],[H|S3]) :- X \== H, diferenca2(T,[X],S3).

/*
?- uniao([1,2],[2,3],[3,4],X).
X = [3, 4, 1, 2] .

?- diferenca([1,2,4,5],[2,3],[3,4],X).
X = [1, 5] .
*/
