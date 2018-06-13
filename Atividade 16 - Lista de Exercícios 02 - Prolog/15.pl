/*
15. Crie uma regra diferenca(S1,S2,S3), a qual recebe dois conjuntos S1 e S2 e retorna em S3 a diferença
de S1 e S2. Por exemplo, diferenca([1,2,3,4],[1,2],S3) deve retornar S3 = [3, 4] e diferenca([1,2],[1,2,3,4],S3)
deve retornar S3 = []. Não utilize nenhuma função pronta to Prolog para esta tarefa.
*/

diferenca(S1,[],S1) :- !.
diferenca([],_,[]) :- !.
diferenca(S1,[H,H1|T],S3) :- diferenca(S1,[H1|T],S4), diferenca(S4,[H],S3).
diferenca([X|T],[X],S3) :- diferenca(T,[X],S3).
diferenca([H|T],[X],[H|S3]) :- X \== H, diferenca(T,[X],S3).

/*
?- diferenca([1,2,3,4,5],[3,4],X).
X = [1, 2, 5] .

?- diferenca([1,2,3,4,5],[6,7],X).
X = [1, 2, 3, 4, 5] .

?- diferenca([1,2,3,4,5],[1,2,3,4,5],X).
X = [] .
*/
