media :: [Int] -> Float
media [] = 0
media x = (fromIntegral (soma x))/(fromIntegral (comprimento x))

soma :: [Int] -> Int
soma [] = 0
soma (a:b) = a + soma b

comprimento :: [Int] -> Int
comprimento [] = 0
comprimento (_:b) = 1 + (comprimento b)

main = do
    print (media [1, 2, 3, 4, 5, 6])