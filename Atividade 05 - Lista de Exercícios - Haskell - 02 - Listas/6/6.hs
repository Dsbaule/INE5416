ocorrencias :: [Int] -> Int -> Int
ocorrencias [] _ = 0
ocorrencias (a:b) x | (a == x) = 1 + (ocorrencias b x)
                    | otherwise = (ocorrencias b x)

main = do
    let n = [1, 2, 3, 3, 5, 6, 3, 9, 3]
    print (ocorrencias n 3)