data Arvore = Null | No Int Arvore Arvore

minhaArvore :: Arvore
minhaArvore = No 52 (No 31 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 Null Null))

somaElementos :: Arvore -> Int
somaElementos Null = 0
somaElementos (No n esq dir) = n + (somaElementos esq) + (somaElementos dir)

buscaElemento :: Arvore -> Int -> Bool
buscaElemento Null _ = False
buscaElemento (No n esq dir) x
    | (n == x) = True
    | otherwise = (buscaElemento esq x) || (buscaElemento dir x)

limiteSup :: Int
limiteSup = 1000 --Define um limite superior para o maior número

minimo :: Int -> Int -> Int
minimo x y  | (x < y) = x
            | otherwise = y

-- Calculo do maior valor entre 2 inteiros
maximo :: Int -> Int -> Int
maximo x y  | (x > y) = x
            | otherwise = y

-- Obtem o menor elemento através da comparação do valor de cada nodo com o minimo de suas sub-arvores filhas
minimoElemento :: Arvore -> Int
minimoElemento Null = limiteSup
minimoElemento (No n esq dir) =
    minimo n (minimo (minimoElemento esq) (minimoElemento dir))

-- Percorre a árvore contabilizando recursivamente o numero de ocorrências do elemento
ocorrenciasElemento :: Arvore -> Int -> Int
ocorrenciasElemento Null _ = 0
ocorrenciasElemento (No n esq dir) x  | (n == x) = 1 + (ocorrenciasElemento esq x) + (ocorrenciasElemento dir x)
                                      | otherwise = (ocorrenciasElemento esq x) + (ocorrenciasElemento dir x)

-- Percorre a árvore contabilizando recursivamente o numero de elementos maiores que o numero passado
maioresQueElemento :: Arvore -> Int -> Int
maioresQueElemento Null _ = 0
maioresQueElemento (No n esq dir) x  | (n > x) = 1 + (maioresQueElemento esq x) + (maioresQueElemento dir x)
                                      | otherwise = (maioresQueElemento esq x) + (maioresQueElemento dir x)

-- Percorre a árvore somando os numeros pares e subtraindo os ímpares recursivamente
subtraiParesImpares :: Arvore -> Int
subtraiParesImpares Null = 0
subtraiParesImpares (No n esq dir)  | (par n) = n + (subtraiParesImpares esq) + (subtraiParesImpares dir)
                                    | otherwise = (subtraiParesImpares esq) + (subtraiParesImpares dir) - n

-- Percorre as duas árvores comparando elementos correspondentes
igual :: Arvore -> Arvore -> Bool
igual Null Null = True
igual Null _ = False
igual _ Null = False
igual (No n1 esq1 dir1) (No n2 esq2 dir2) = (n1 == n2) && (igual esq1 esq2) && (igual dir1 dir2)

-- Percorre a árvore somando 1 a altura maxima dos filhos de cada nodo
altura :: Arvore -> Int
altura Null = -1
altura (No n esq dir) = 1 + (maximo (altura esq) (altura dir))

-- Percorre a árvore contabilizando o numero de folhas
folhas :: Arvore -> Int
folhas Null = 0
folhas (No _ Null Null) = 1
folhas (No n esq dir) = (folhas esq) + (folhas dir)

-- Percorre a arvore concatenando os valores em ordem a um array
emOrdem :: Arvore -> [Int]
emOrdem Null = []
emOrdem (No n esq dir) = (emOrdem esq) ++ [n] ++ (emOrdem dir)

-- Percorre a arvore concatenando os valores menores que o numero passado a um array
menoresQueElemento :: Arvore -> Int -> [Int]
menoresQueElemento Null _ = []
menoresQueElemento (No n esq dir) x | ((n < x) && (par n)) = [n] ++ (menoresQueElemento esq x) ++ (menoresQueElemento dir x)
                                    | otherwise = (menoresQueElemento esq x) ++ (menoresQueElemento dir x)

-- Verifica se o número é par
par :: Int -> Bool
par n = (mod n 2) == 0

main = do putStrLn (show (somaElementos minhaArvore))
          putStrLn (show (buscaElemento minhaArvore 30))
          putStrLn (show (buscaElemento minhaArvore 55))
          putStrLn (show (minimoElemento minhaArvore))
          putStrLn (show (ocorrenciasElemento minhaArvore 55))
          putStrLn (show (maioresQueElemento minhaArvore 32))
          putStrLn (show (subtraiParesImpares minhaArvore))
          putStrLn (show (igual minhaArvore minhaArvore))
          putStrLn (show (igual minhaArvore (No 31 (No 52 (No 12 Null Null) (No 35 Null Null)) (No 56 (No 55 Null Null) (No 64 Null Null)))))
          putStrLn (show (altura minhaArvore))
          putStrLn (show (folhas minhaArvore))
          putStrLn (show (emOrdem minhaArvore))
          putStrLn (show (menoresQueElemento minhaArvore 60))
