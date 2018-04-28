diferencaMaiorMenor :: [Int] -> Int
diferencaMaiorMenor x = (maior x) - (menor x)

menor :: [Int] -> Int
menor (a:b) | (b == []) = a
            | (a < (menor b)) = a
            | otherwise = menor b

maior :: [Int] -> Int
maior (a:b) | (b == []) = a
            | (a > (maior b)) = a
            | otherwise = maior b
            
main = do
    print (diferencaMaiorMenor [1, 2, 3, -50, -45, 4, 5, 6])