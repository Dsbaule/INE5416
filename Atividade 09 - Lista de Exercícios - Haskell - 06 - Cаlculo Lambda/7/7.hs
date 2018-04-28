main = do
    print (map (\x -> (mod x 2) == 0) [1, 2, 3, 4, 5, 6, 7, 8])
