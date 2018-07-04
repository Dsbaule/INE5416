/*
Trabalho VI - Programação Lógica - Prolog
Sistema Especialista para Diagnósticos de Doenças Transmitidas pelo Aedes Aegypti
*/

% Regras de 1 a 3 (Temperatura)
febre(if_then_else('Temperatura corporal acima de 38 graus?',
                if_then_else('Febre durou de 2 a 3 dias?',
                        doenca(chikungunya),
                        if_then_else('Febre durou de 4 a 7 dias?',
                                doenca(dengue),
                                false)),
                doenca(zika))).

% Regras de 4 a 7 (Manchas na pele)
manchas(if_then_else('Aparecimento de manchas na pele?',
                if_then_else('A partir do 1o ou 2o dia?',
                        doenca(zika),
                        if_then_else('A partir do 2o ao 5o dia?',
                                doenca(chikungunya),
                                if_then_else('A partir do 4o dia?',
                                        doenca(dengue),
                                        false))),
                doenca(dengue))).

% Regras de 8 a 11 (Dor muscular)
dorMuscular(if_then_else('Sofre dor muscular?',
                if_then_else('A dor eh intensa?',
                        doenca(dengue),
                        if_then_else('A dor eh moderada?',
                                doenca(zika),
                                if_then_else('A dor eh leve?',
                                        doenca(chikungunya),
                                        false))),
                false)).

% Regras de 12 a 15 (Dor nas articulações)
dorNasArticulacoes(if_then_else('Sofre de dor nas articulacoes?',
                if_then_else('A dor eh intensa?',
                        doenca(chikungunya),
                        if_then_else('A dor eh moderada?',
                                doenca(zika),
                                if_then_else('A dor eh leve?',
                                        doenca(dengue),
                                        false))),
                false)).

% Regras de 16 a 18 (Edema nas articulações)
edemaNasArticulacoes(if_then_else('Aparicao de edema nas articulacoes?',
                if_then_else('Edema de intensidade leve?',
                        doenca(zika),
                        if_then_else('Edema de intensidade moderada ou intensa?',
                                doenca(chikungunya),
                                false)),
                doenca(dengue))).

% Regras de 19 a 21 (conjuntivite)
conjuntivite(if_then_else('Sofre de conjuntivite?',
                doenca(zika_e_chikungunya),
                if_then_else('Sofre de dor intensa nas articulacoes?',
                        doenca(chikungunya),
                        if_then_else('Sofre de dor leve nas articulacoes?',
                                doenca(dengue),
                                false)))).

% Regras de 22 a 26 (Dor de cabeça)
dorDeCabeca(if_then_else('Sofre de dor de cabeca?',
                if_then_else('Dor de cabeca leve?',
                        doenca(zika_e_chikungunya),
                        if_then_else('Dor de cabeca moderada?',
                                if_then_else('Sofre de dor intensa nas articulacoes?',
                                        doenca(chikungunya),
                                        if_then_else('Sofre de dor moderada nas articulacoes?',
                                                doenca(zika),
                                                false)),
                                if_then_else('Dor de cabeca intensa?',
                                        doenca(dengue),
                                        false))),
                false)).

% Regras 27 a 31 (Coceira)
coceira(if_then_else('Sofre de Coceira?',
                if_then_else("Coceira de intensidade leve?",
                        if_then_else("Sofre de dor muscular intensa?",
                                doenca(dengue),
                                if_then_else("Sofre de dor muscular leve?",
                                        doenca(chikungunya),
                                        false)),
                        if_then_else("Coceira de intensidade moderada?",
                                doenca(zika),
                                if_then_else("Coceira intensa?",
                                        doenca(zika),
                                        false))),
                false)).

% Regras de 32 a 34 (Alteracoes no sistema nervoso)
alteracoesSistemaNervoso(if_then_else('Sofreu alteracoes no sistema nervoso?',
                doenca(zika),
                if_then_else('Sofreu dor articular intensa?',
                        doenca(chikungunya),
                        if_then_else('Sofreu dor articular leve?',
                                doenca(dengue),
                                false)))).

% Chamada comum para verificar uma doenca, testa todas as regras se necessario
doenca(D) :-
        doencaFebre(D); % Regras de 1 a 3 (Temperatura)
        manchas(D); % Regras de 4 a 7 (Manchas na pele)
        dorMuscular(D); % Regras de 8 a 11 (Dor muscular)
        dorNasArticulacoes(D); % Regras de 12 a 15 (Dor nas articulações)
        edemaNasArticulacoes(D); % Regras de 16 a 18 (Edema nas articulações)
        conjuntivite(D); % Regras de 19 a 21 (conjuntivite)
        dorDeCabeca(D); % Regras de 22 a 26 (Dor de cabeça)
        coceira(D); % Regras 27 a 31 (Coceira)
        alteracoesSistemaNervoso(D). % Regras de 32 a 34 (Alteracoes no sistema nervoso)

% Chamada para testar apenas as Regras de 1 a 3 (Temperatura)
doencaFebre(D) :-
        febre(A), % Regras de 1 a 3 (Temperatura)
        tree_doenca(A, D).

% Chamada para testar apenas as Regras de 4 a 7 (Manchas na pele)
doencaManchas(D) :-
        manchas(A), % Regras de 4 a 7 (Manchas na pele)
        tree_doenca(A, D).

% Chamada para testar apenas as Regras de 8 a 11 (Dor muscular)
doencaDorMuscular(D) :-
        dorMuscular(A), % Regras de 8 a 11 (Dor muscular)
        tree_doenca(A, D).

% Chamada para testar apenas as Regras de 12 a 15 (Dor nas articulações)
doencaDorNasArticulacoes(D) :-
        dorNasArticulacoes(A), % Regras de 12 a 15 (Dor nas articulações)
        tree_doenca(A, D).

% Chamada para testar apenas as Regras de 16 a 18 (Edema nas articulações)
doencaEdemaNasArticulacoes(D) :-
        edemaNasArticulacoes(A), % Regras de 16 a 18 (Edema nas articulações)
        tree_doenca(A, D).

% Chamada para testar apenas as Regras de 19 a 21 (conjuntivite)
doencaConjuntivite(D) :-
        conjuntivite(A), % Regras de 19 a 21 (conjuntivite)
        tree_doenca(A, D).

% Chamada para testar apenas as Regras de 22 a 26 (Dor de cabeça)
doencaDorDeCabeca(D) :-
        dorDeCabeca(A), % Regras de 22 a 26 (Dor de cabeça)
        tree_doenca(A, D).

% Chamada para testar apenas as Regras 27 a 31 (Coceira)
doencaCoceira(D) :-
        coceira(A), % Regras 27 a 31 (Coceira)
        tree_doenca(A, D).

% Chamada para testar apenas as Regras de 32 a 34 (Alteracoes no sistema nervoso)
doencaAlteracoesSistemaNervoso(D) :-
        alteracoesSistemaNervoso(A), % Regras de 32 a 34 (Alteracoes no sistema nervoso)
        tree_doenca(A, D).

% Definicao da arvore
tree_doenca(doenca(A), A).
tree_doenca(if_then_else(Cond,Then,Else), A) :-
        (   is_true(Cond) ->
            tree_doenca(Then, A)
        ;   tree_doenca(Else, A)
        ).

% Definicao do questionamento ao usuario
is_true(Q) :-
        format("~w\n", [Q]),
        read(s).
