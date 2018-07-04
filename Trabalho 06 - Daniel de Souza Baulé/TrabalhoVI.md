# INE5416 - Paradigmas de Programação
# Trabalho VI - Programação Lógica - Prolog
# Sistema Especialista para Diagnósticos de Doenças Transmitidas pelo Aedes Aegypti

### Aluno: Daniel de Souza Baulé (16200639)

Realização das consultas ao sistema especialista para cada regra descrita no artigo *"Utilização de Sistema Especialista para Diagnósticos de Doenças
Transmitidas pelo Aedes Aegypti"*.

Algumas consultas utilizam chamadas especiais que verificam apenas as regras relacionadas com a consulta em particular, isso se dá devido ao sistema chegar a uma conclusão antes de realizar todas as consultas no caso da consulta principal `doenca(X).`. Logo, é necessário ir direto para as consultas relacionadas para validar as regras, através de chamadas como `doencaManchas(X).` e `doencaDorMuscular(X).`, por exemplo.

### REGRA 1
**SE** temperatura corporal = acima de 38 ºC **E** duração febre = 2 a 3 dias **ENTÃO** chikungunya

```Prolog
?- doenca(X).
Temperatura corporal acima de 38 graus?
|: s.
Febre durou de 2 a 3 dias?
|: s.

X = chikungunya .
```

### REGRA 2
**SE** temperatura corporal = acima de 38 ºC **E** duração febre = 4 a 7 dias **ENTÃO** dengue

```Prolog
?- doenca(X).
Temperatura corporal acima de 38 graus?
|: s.
Febre durou de 2 a 3 dias?
|: n.
Febre durou de 4 a 7 dias?
|: s.

X = dengue .
```

### REGRA 3
**SE** temperatura corporal = abaixo de 38 ºC **ENTÃO** zika

```Prolog
?- doenca(X).
Temperatura corporal acima de 38 graus?
|: n.

X = zika .
```

### REGRA 4
**SE** dia de aparecimento de manchas na pele = 1º ou 2º **ENTÃO** zika

```Prolog
?- doencaManchas(X).
Aparecimento de manchas na pele?
|: s.
A partir do 1o ou 2o dia?
|: s.

X = zika.
```

### REGRA 5
**SE** dia de aparecimento de manchas na pele = 2º ao 5º **ENTÃO** chikungunya

```Prolog
?- doencaManchas(X).
Aparecimento de manchas na pele?
|: s.
A partir do 1o ou 2o dia?
|: n.
A partir do 2o ao 5o dia?
|: s.

X = chikungunya.
```

### REGRA 6
**SE** dia de aparecimento de manchas na pele = a partir do 4º **ENTÃO** dengue

```Prolog
?- doencaManchas(X).
Aparecimento de manchas na pele?
|: s.
A partir do 1o ou 2o dia?
|: n.
A partir do 2o ao 5o dia?
|: n.
A partir do 4o dia?
|: s.

X = dengue.
```

### REGRA 7
**SE** dia de aparecimento de manchas na pele = não tem manchas **ENTÃO** dengue

```Prolog
?- doencaManchas(X).
Aparecimento de manchas na pele?
|: n.

X = dengue.
```

### REGRA 8
**SE** dor nos músculos = com dor **E** intensidade = intensa **ENTÃO** dengue

```Prolog
?- doencaDorMuscular(X).
Sofre dor muscular?
|: s.
A dor eh intensa?
|: s.

X = dengue.
```

### REGRA 9
**SE** dor nos músculos = com dor **E** intensidade = moderada **ENTÃO** zika

```Prolog
?- doencaDorMuscular(X).
Sofre dor muscular?
|: s.
A dor eh intensa?
|: n.
A dor eh moderada?
|: s.

X = zika.
```

### REGRA 10
**SE** dor nos músculos = com dor **E** intensidade = leve **ENTÃO** chikungunya

```Prolog
?- doencaDorMuscular(X).
Sofre dor muscular?
|: s.
A dor eh intensa?
|: n.
A dor eh moderada?
|: n.
A dor eh leve?
|: s.

X = chikungunya.
```

### REGRA 11
**SE** dor nos músculos = sem dor **ENTÃO** não tem doença

```Prolog
?- doencaDorMuscular(X).
Sofre dor muscular?
|: n.

false.
```

### REGRA 12
**SE** dor nas articulações = com dor **E** intensidade = intensa **ENTÃO** chikungunya

```Prolog
?- doencaDorNasArticulacoes(X).
Sofre de dor nas articulacoes?
|: s.
A dor eh intensa?
|: s.

X = chikungunya.
```

### REGRA 13
**SE** dor nas articulações = sem dor **ENTÃO** não tem doença

```Prolog
?- doencaDorNasArticulacoes(X).
Sofre de dor nas articulacoes?
|: n.

false.
```

### REGRA 14
**SE** dor nas articulações = com dor **E** intensidade = leve **ENTÃO** dengue

```Prolog
?- doencaDorNasArticulacoes(X).
Sofre de dor nas articulacoes?
|: s.
A dor eh intensa?
|: n.
A dor eh moderada?
|: n.
A dor eh leve?
|: s.

X = dengue.
```

### REGRA 15
**SE** dor nas articulações = com dor **E** intensidade = moderada **ENTÃO** zika

```Prolog
?- doencaDorNasArticulacoes(X).
Sofre de dor nas articulacoes?
|: s.
A dor eh intensa?
|: n.
A dor eh moderada?
|: s.

X = zika.
```

### REGRA 16
**SE** Edema nas articulações = não tenho **ENTÃO** dengue

```Prolog
Aparicao de edema nas articulacoes?
|: n.

X = dengue.
```

### REGRA 17
**SE** Edema nas articulações = leve intensidade **ENTÃO** zika

```Prolog
?- doencaEdemaNasArticulacoes(X).
Aparicao de edema nas articulacoes?
|: s.
Edema de intensidade leve?
|: s.

X = zika.
```

### REGRA 18
**SE** Edema nas articulações = moderada ou intensa **ENTÃO** chikungunya

```Prolog
?- doencaEdemaNasArticulacoes(X).
Aparicao de edema nas articulacoes?
|: s.
Edema de intensidade leve?
|: n.
Edema de intensidade moderada ou intensa?
|: s.

X = chikungunya.
```

### REGRA 19
**SE** conjuntivite = tenho **ENTÃO** zika **E** chikungunya

```Prolog
?- doencaConjuntivite(X).
Sofre de conjuntivite?
|: s.

X = zika_e_chikungunya.
```

### REGRA 20
**SE** conjuntivite = não tenho **E** intensidade nas dores articulares = intensa **ENTÃO** chikungunya

```Prolog
?- doencaConjuntivite(X).
Sofre de conjuntivite?
|: n.
Sofre de dor intensa nas articulacoes?
|: s.

X = chikungunya.
```

### REGRA 21
**SE** conjuntivite = não tenho **E** intensidade nas dores articulares = leve **ENTÃO** dengue

```Prolog
?- doencaConjuntivite(X).
Sofre de conjuntivite?
|: n.
Sofre de dor intensa nas articulacoes?
|: n.
Sofre de dor leve nas articulacoes?
|: s.

X = dengue.
```

### REGRA 22
**SE** dor de cabeça = sem dor **ENTÃO** não tem doença

```Prolog
?- doencaDorDeCabeca(X).
Sofre de dor de cabeca?
|: n.

false.
```

### REGRA 23
**SE** dor de cabeça = com dor **E** intensidade = leve **ENTÃO** chikungunya **E** zika

```Prolog
?- doencaDorDeCabeca(X).
Sofre de dor de cabeca?
|: s.
Dor de cabeca leve?
|: s.

X = zika_e_chikungunya.
```

### REGRA 24
**SE** dor de cabeça = com dor **E** intensidade = moderada **E** intensidade nas dores articulares = intensa **ENTÃO** chikungunya

```Prolog
?- doencaDorDeCabeca(X).
Sofre de dor de cabeca?
|: s.
Dor de cabeca leve?
|: n.
Dor de cabeca moderada?
|: s.
Sofre de dor intensa nas articulacoes?
|: s.

X = chikungunya
```

### REGRA 25
**SE** dor de cabeça = com dor **E** intensidade = intensa **ENTÃO** dengue

```Prolog
?- doencaDorDeCabeca(X).
Sofre de dor de cabeca?
|: s.
Dor de cabeca leve?
|: n.
Dor de cabeca moderada?
|: n.
Dor de cabeca intensa?
|: s.

X = dengue.
```

### REGRA 26
**SE** dor de cabeça = com dor **E** intensidade = moderada **E** intensidade nas dores articulares = moderada **ENTÃO** zika

```Prolog
?- doencaDorDeCabeca(X).
Sofre de dor de cabeca?
|: s.
Dor de cabeca leve?
|: n.
Dor de cabeca moderada?
|: s.
Sofre de dor intensa nas articulacoes?
|: n.
Sofre de dor moderada nas articulacoes?
|: s.

X = zika.
```

### REGRA 27
**SE** coceira = não tenho **ENTÃO** não tem doença

```Prolog
?- doencaCoceira(X).
Sofre de Coceira?
|: n.

false.
```

### REGRA 28
**SE** coceira = tenho **E** intensidade coceira = leve **E** intensidade das dores musculares = intensa **ENTÃO** dengue

```Prolog
?- doencaCoceira(X).
Sofre de Coceira?
|: s.
Coceira de intensidade leve?
|: s.
Sofre de dor muscular intensa?
|: s.

X = dengue.
```

### REGRA 29
**SE** coceira = tenho **E** intensidade coceira = leve **E** intensidade das dores musculares = leve **ENTÃO** chikungunya

```Prolog
?- doencaCoceira(X).
Sofre de Coceira?
|: s.
Coceira de intensidade leve?
|: s.
Sofre de dor muscular intensa?
|: n.
Sofre de dor muscular leve?
|: s.

X = chikungunya
```

### REGRA 30
**SE** coceira = tenho **E** intensidade coceira = moderada **ENTÃO** zika

```Prolog
?- doencaCoceira(X).
Sofre de Coceira?
|: s.
Coceira de intensidade leve?
|: n.
Coceira de intensidade moderada?
|: s.

X = zika.
```

### REGRA 31
**SE** coceira = tenho **E** intensidade coceira = intensa **ENTÃO** zika

```Prolog
?- doencaCoceira(X).
Sofre de Coceira?
|: s.
Coceira de intensidade leve?
|: n.
Coceira de intensidade moderada?
|: n.
Coceira intensa?
|: s.

X = zika.
```

### REGRA 32
**SE** alterações no sistema nervoso = sim **ENTÃO** zika

```Prolog
?- doencaAlteracoesSistemaNervoso(X).
Sofreu alteracoes no sistema nervoso?
|: s.

X = zika.
```

### REGRA 33
**SE** alterações no sistema nervoso = não **E** intensidade nas dores articulares = leve **ENTÃO** dengue

```Prolog
?- doencaAlteracoesSistemaNervoso(X).
Sofreu alteracoes no sistema nervoso?
|: n.
Sofreu dor articular intensa?
|: n.
Sofreu dor articular leve?
|: s.

X = dengue.
```

### REGRA 34
**SE** alterações no sistema nervoso = não **E** intensidade nas dores articulares = intensa **ENTÃO** chikungunya

```Prolog
?- doencaAlteracoesSistemaNervoso(X).
Sofreu alteracoes no sistema nervoso?
|: n.
Sofreu dor articular intensa?
|: s.

X = chikungunya.
```
