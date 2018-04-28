mapear :: (t -> y) -> [t] -> [y]
mapear _ [] = []
mapear f (a:b) =  (f a) : (mapear f b)

soma2 :: Int -> Int
soma2 a = a + 2

main = print (mapear soma2 [1, 2, 3])
