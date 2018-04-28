filtrar :: (t -> Bool) -> [t] -> [t]
filtrar _ [] = []
filtrar f (a:b) | (f a) = a : (filtrar f b)
                | otherwise = (filtrar f b)

par :: Int -> Bool
par a = (mod a 2) == 0

main = do
  print (filtrar par [1, 2, 3, 4, 5, 6, 7, 8])
