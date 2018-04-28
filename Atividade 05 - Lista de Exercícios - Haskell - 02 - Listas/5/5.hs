busca :: [Int] -> Int -> Bool
busca [] _ = False
busca (a:b) x   | (a == x) = True
                | otherwise = (busca b x)

main = do
    let n = [1, 2, 3, -50, -45, 4, 5, 6]
    print (busca n 7)
    print (busca n 3)