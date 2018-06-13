/*
14. Crie uma regra uniao(S1,S2,S3), a qual recebe dois conjuntos S1 e S2 e retorna em S3 a união de S1 e
S2. Por exemplo, uniao([1,2,3,4],[1,2,5,6],S3) deve retornar S3 = [3, 4, 1, 2, 5, 6]. Não utilize nenhuma
função pronta to Prolog para esta tarefa.
*/

uniao([],L2,L2).

uniao([H|T],L2,[H|L]) :- uniao(T,L2,L).

uniao([X],L2,L)

% Melhorar inserindo a cabeca sempre na segunda lista, ao inves de o ultimo elemento.

/*
?- uniao([1,2,3,4],[1,2,5,6],S3).
S3 = [1, 2, 3, 4, 1, 2, 5, 6].
*/
