/*
14. Crie uma regra uniao(S1,S2,S3), a qual recebe dois conjuntos S1 e S2 e retorna em S3 a união de S1 e
S2. Por exemplo, uniao([1,2,3,4],[1,2,5,6],S3) deve retornar S3 = [3, 4, 1, 2, 5, 6]. Não utilize nenhuma
função pronta to Prolog para esta tarefa.
*/

uniao([],L2,L2).
uniao([H|T],L1,L) :- uniao(T,L1,L2), insereSemRepetir(H,L2,L).

insereSemRepetir(X,[],[X]).
insereSemRepetir(X,[H|T],[H|L]) :- X \== H, insereSemRepetir(X,T,L).
insereSemRepetir(X,[X|T],[X|T]).

% Melhorar inserindo a cabeca sempre na segunda lista, ao inves de o ultimo elemento.

/*
?- uniao([1,2,3],[3,4,5],X).
X = [3, 4, 5, 2, 1] .

?- uniao([1,2,3],[2,3,4,5],X).
X = [2, 3, 4, 5, 1] .
*/
