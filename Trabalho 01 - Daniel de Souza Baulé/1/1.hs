-- Para cada elemento de A, verifica se B também o possui e remove este elemento de ambos.
-- Caso B não possua o elemento, ou algum dos vetores fique sem elementos antes do outro,
-- os vetores não possuiam os mesmos elementos. Caso ambos fiquem vazios simultaneamente, possuiam.
mesmosElementos :: [Int] -> [Int] -> Bool
mesmosElementos [] [] = True
mesmosElementos [] _ = False
mesmosElementos _ [] = False
mesmosElementos (a:b) y | (temElemento y a) = mesmosElementos (retiraElemento b a) (retiraElemento y a)
                        | otherwise = False

-- Retira o elemnto do array (todas as ocorrências)
retiraElemento :: [Int] -> Int -> [Int]
retiraElemento [] _ = []
retiraElemento (a:b) x  | (a == x) = retiraElemento b x
                        | otherwise = a : (retiraElemento b x)

-- verifica se o array possui um numero como elemento (ao menos uma ocorrencia)
temElemento :: [Int] -> Int -> Bool
temElemento [] _ = False
temElemento (a:b) x | (a == x) = True
                    | otherwise = temElemento b x

main = do
  print (mesmosElementos [1, 2, 3, 4, 5, 7] [4, 4, 5, 4, 3, 2, 3, 4, 5, 5, 3, 2, 1])
  print (mesmosElementos [1, 2, 3, 4, 5, 5] [4, 4, 5, 4, 3, 2, 3, 4, 5, 5, 3, 2, 1])
