/*
3. Crie uma regra numerosParaPalavras(L1,L2) que receba uma lista L1 contendo os numeros de 0 ate 9
e retorne uma lista L2 que contenha a mesma lista de numeros de 0 ate 9, mas escritos como palavras, ou
seja, zero, um, dois, tres (sem acento) e assim por diante. N~ao utilize nenhuma func~ao pronta to Prolog
para esta tarefa.
*/

numerosParaPalavras([],[]) :- !.
numerosParaPalavras([0|T],[zero|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([1|T],[um|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([2|T],[dois|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([3|T],[tres|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([4|T],[quatro|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([5|T],[cinco|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([6|T],[seis|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([7|T],[sete|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([8|T],[oito|T2]) :- numerosParaPalavras(T,T2).
numerosParaPalavras([9|T],[nove|T2]) :- numerosParaPalavras(T,T2).

/*
?- numerosParaPalavras([0,1,2,3,4,5,6,7,8,9],X).
X = [zero, um, dois, tres, quatro, cinco, seis, sete, oito|...] .

?- numerosParaPalavras([9,8,7,6,5,4,3,2,1,0],X).
X = [nove, oito, sete, seis, cinco, quatro, tres, dois, um|...] .
*/
