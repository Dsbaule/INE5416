/*
7. Crie uma regra palindrome(L), a qual recebe uma lista L e retorna se ela é uma palı́ndrome. Uma lista é
uma palı́ndrome se os itens da esquerda para a direita estão na mesma ordem da direita para a esquerda.
Ex: [1,2,3,4,3,2,1] é uma palı́ndrome. Não utilize nenhuma função pronta to Prolog para esta tarefa.
*/

palindrome([]).
palindrome([_]).
palindrome([H1,H2|T]) :- igualUltimo(H1,[H2|T]), removeUltimo([H2|T],L), palindrome(L).

igualUltimo(X, [X]).
igualUltimo(X, [_,H2|T]) :- igualUltimo(X,[H2|T]).

removeUltimo([_], []).
removeUltimo([],[]).
removeUltimo([H1,H2|T], [H1|L]) :- removeUltimo([H2|T],L).

/*
?- palindrome([1,2,3,4]).
false.

?- palindrome([1,2,3,4,3,2,1]).
true .

?- palindrome([1,2,3,4,4,3,2,1]).
true .

?- palindrome([1,2,3,4,3,3,2,1]).
false.
*/
