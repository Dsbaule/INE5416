menor :: [Int] -> Int
menor (a:b) | (b == []) = a
            | (a < (menor b)) = a
            | otherwise = menor b

main = do
    print (menor [1, 2, 3, -50, -45, 4, 5, 6])