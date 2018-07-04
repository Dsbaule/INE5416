%Regras 1 a 3
temperatura(if_then_else('temperatura acima de 38',
                  if_then_else('durou de 4 a 7 dias',
                               doenca(dengue),
                               doenca(chikungunya)),
                  doenca(zika))).
% Regras 4 a 7
mancha(if_then_else('tem mancha na pele',
                  if_then_else('apareceu no 1o ou 2o dia',
                               doenca(zika),
                               if_then_else('apareceu a partir 4o dia',
                                            false,
                                            doenca(chikungunya))),
                  doenca(dengue))).
% Regras 8 a 11
muscular(if_then_else('tem dor muscular',
                  if_then_else('dores leves',
                               doenca(chikungunya),
                               if_then_else('dores moderadas',
                                            doenca(zika),
                                            doenca(dengue))),
                  false)).
% Regras 12 a 15
articular(if_then_else('tem dor nas articulacoes',
                  if_then_else('dores leves',
                               doenca(dengue),
                               if_then_else('dores moderadas',
                                            doenca(zika),
                                            doenca(chikungunya))),
                  false)).
% Regras 16 a 18
edema(if_then_else('tem edemas nas articulacoes',
                  if_then_else('edemas leves',
                               doenca(zika),
                               doenca(chikungunya)),
                  doenca(dengue))).
% Regras 19 a 21
conjuntivite(if_then_else('tem conjuntivite',
                  doenca(zikaEchikungunya),
                  if_then_else('tem dor nas articulacoes',
                                if_then_else('dores leves',
                                             doenca(dengue),
                                             if_then_else('dores intensa',
                                                          doenca(chikungunya),
                                                          false)),
                  				false))).
% Regras 22 a 26
cabeca(if_then_else('tem dor de cabeca',
                  if_then_else('dores leves',
                               doenca(zikaEchikungunya),
                               if_then_else('dores moderadas',
                                            if_then_else('dores nas articulacoes moderadas',
                                                         doenca(zika),
                                                         doenca(chikungunya)),
                                            doenca(dengue))),
                  false)).
% Regras 27 a 31
coceira(if_then_else('tem coceira',
                  if_then_else('coceiras moderada ou intensa',
                               doenca(zika),
                               if_then_else('dores musculares intensas',
                                            doenca(dengue),
                                            if_then_else('dores musculares leves',
                                                          doenca(chikungunya),
                                                          false))),
                  false)).
% Regras 32 a 34
nervoso(if_then_else('tem alteracoes nervosas',
                  if_then_else('tem dores articulares leves',
                               doenca(dengue),
                               if_then_else('dores intensas',
                                            doenca(chikungunya),
                                            false)),
                  doenca(zika))).



doenca(A) :-
       doencaTemperatura(A);
       doencaMancha(A);
       doencaMuscular(A);
       doencaArticular(A);
       doencaEdema(A);
       doencaConjuntivite(A);
       doencaCabeca(A);
       doencaCoceira(A);
       doencaSistemaNervoso(A).
doencaTemperatura(A) :-
       temperatura(T),
       tree_doenca(T,A).
doencaMancha(A) :-
       mancha(T),
       tree_doenca(T,A).
doencaMuscular(A) :-
       muscular(T),
       tree_doenca(T,A).
doencaArticular(A) :-
       articular(T),
       tree_doenca(T,A).
doencaEdema(A) :-
       edema(T),
       tree_doenca(T,A).
doencaConjuntivite(A) :-
       conjuntivite(T),
       tree_doenca(T,A).
doencaCabeca(A) :-
       cabeca(T),
       tree_doenca(T,A).
doencaCoceira(A) :-
       coceira(T),
       tree_doenca(T,A).
doencaSistemaNervoso(A) :-
       nervoso(T),
       tree_doenca(T,A).

tree_doenca(doenca(A), A).
tree_doenca(if_then_else(Cond,Then,Else), A) :-
        (   is_true(Cond) ->
            tree_doenca(Then, A)
        ;   tree_doenca(Else, A)
        ).

is_true(Q) :-
        format("~w?\n", [Q]),
        read(sim).
