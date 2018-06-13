% Relacao de filmes
%    filme(id, titulo, ano, diretor, nacionalidade).
%
filme(f1, 'Monty Python: O Sentido da Vida', 1983, 'Terry Jones', uk).
filme(f2, 'Edukators', 2004, 'Hans Weingartner', de).
filme(f3, 'Lavoura Arcaica', 2001, 'Luiz Fernando Carvalho', br).
filme(f4, 'Lisbela e o Prisioneira', 2003, 'Guel Arraes', br).
filme(f5, 'Abril despeda�ado', 2001, 'Walter Salles', br).
filme(f6, 'Di�rios de motocicleta', 2004, 'Walter Salles', br).

% Relacao de paises
%     pais(sigla, nome).
%
pais(uk, 'Unided Kingdom').
pais(de, 'Alemanha').
pais(br, 'Brasil').

% Relacao de DVD (a caixa em si)
%     dvd(id do DVD, id do filme, estante).
%
dvd(d1, f1, est1).
dvd(d2, f2, est1).
dvd(d4, f4, est1).
dvd(d3, f3, est2).
dvd(d5, f5, est3).
dvd(d6, f1, est1).
dvd(d7, f2, est4).
dvd(d8, f2, est4).

% Relacao de clientes
%     cliente(cod, nome, telefone).
%
cliente(c1, 'Bob', '333-3112').
cliente(c2, 'Zeca', '245-1099').
cliente(c3, 'Tom', '323-0685').
cliente(c4, 'Bianca', '333-4391').
cliente(c5, 'Alice', '251-7439').
cliente(c6, 'Maria', '212-3271').

% Relacao de locacoes
%     locacao(cod cliente, nro do DVD, data de entrega)
%
locacao(c1, d1, '2005-11-07').
locacao(c1, d2, '2005-11-07').
locacao(c3, d5, '2005-11-09').
locacao(c2, d3, '2005-11-10').
locacao(c3, d3, '2005-11-11').
locacao(c4, d8, '2005-11-12').
locacao(c5, d7, '2005-11-12').
locacao(c6, d6, '2005-11-12').
locacao(c1, d5, '2005-11-13').
locacao(c1, d6, '2005-11-13').
locacao(c6, d2, '2005-11-14').
locacao(c3, d7, '2005-11-14').
locacao(c3, d8, '2005-11-14').
locacao(c5, d1, '2005-11-15').

/*
1. Para os itens abaixo, utilize o arquivo dvd.pl disponı́vel no Moodle juntamente com este enunciado. Crie
consultas para responder às seguintes perguntas. Adicione as consultas ao final do arquivo dvd.pl, em
comentário, e identificando cada consulta de acordo com os itens abaixo. Adicione também, para cada
consulta, o resultado dado pelo Prolog.

(a) Retornar a lista de todos os tı́tulos de filmes lançados antes de 2001.

    findall(F, filme(_,F,2001,_,_), Filmes).

(b) Retornar a lista de todos os tı́tulos de filmes lançados entre 2001 (inclusive) e 2004 (inclusive).

    findall(F, (filme(_,F,X,_,_), X >= 2001, X =< 2004), Filmes).

(c) Retornar a lista de todos os tı́tulos de filmes, de maneira ordenada, produzidos no ’Brasil’.

    Com findall: findall(F, filme(_,F,_,_,br), Filmes), sort(Filmes, FilmesSorted).
    Com setof:   setof(Titulo, Id ^ Ano ^ Diretor ^ filme(Id, Titulo, Ano, Diretor, br), Filmes).

(d) Retornar a lista de todos os tı́tulos de filmes, de maneira ordenada, nao produzidos no ’Brasil’.

    setof(Titulo, Id ^ Ano ^ Diretor ^ Nacionalidade ^ (filme(Id, Titulo, Ano, Diretor, Nacionalidade), Nacionalidade \== br), Filmes).

(e) Retornar a lista de todos os tı́tulos e diretores dos filmes produzidos na ’Alemanha’ com ano de
lançamento é 2004 ou anterior.

    setof(F, I ^ X ^ (filme(I,F,X,Diretor,de), X >= 2001, X =< 2004), Filmes).

(f) Retornar a lista de todos os identificadores de DVD’s com filmes não produzidos no ’Brasil’.

    findall(D, (dvd(D,F,_), filme(F,_,_,_,N), N \== br), DVDs).

(g) Retornar a lista de todos os identificadores de DVD’s com filmes produzidos no ’Brasil’ e que estão
na estante 2.

    findall(D, (dvd(D,F,est2), filme(F,_,_,_,br)), DVDs).

(h) Retornar a lista de todos os diretores de filmes, ordenados, cujos DVD’s estão na estante 1.

    setof(Dir, D ^ F ^ T ^ A ^ N ^ est ^ (dvd(D,F,est1), filme(F,T,A,Dir,N)), Diretor).

(i) Retornar a lista de todos os tı́tulos de filmes que não possuem um DVD.

    

(j) Retornar a lista de todos os nomes de paı́ses que possuem filmes com DVD’s nas estantes 1 ou 4.
(k) Retornar a lista de todos os nomes de clientes que alugaram filmes no dia 7 de novembro de 2005.
(l) Retornar a lista de todas as estantes que possuem filmes que tiveram alguma locação.
(m) Retornar a lista de tı́tulos de filmes alugados pela cliente ’Maria’.
(n) Retornar a quantidade de filmes diferentes alugados pela cliente ’Maria’.
(o) Retornar a lista de tı́tulos de filmes agrupados por estante, ou seja, para cada estante mostrar os
filmes nela.
(p) Retornar a lista de nomes de paı́ses que o cliente ’Bob’ alugou filmes no dia 7 de novembro de 2005.
(q) Retornar a quantidade de filmes produzidos no Brasil alugados por ’Bob’.
(r) Retornar a lista de tı́tulos dos filmes (sem repetições) agrupados por cliente, ou seja, para cada cliente
mostrar os filmes alugados por ele.
(s) Retornar a lista de tı́tulos dos filmes alugados por ambos ’Zeca’ e ’Tom’, ou seja, apenas os filmes
em comum alugados por ambos.
(t) Retornar a lista de tı́tulos dos filmes alugados por ’Bob’, mas não alugados por ’Maria’.
(u) Retornar a lista de tı́tulos dos filmes nunca alugados nem por ’Bob’ e nem por ’Maria’.
*/
