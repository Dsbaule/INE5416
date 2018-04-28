soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

main = do
    print (soma [1, 2, 3, 4, 5, 6])