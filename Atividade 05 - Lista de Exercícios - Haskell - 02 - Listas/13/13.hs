apagarEnquanto :: (t -> Bool) -> [t] -> [t]
apagarEnquanto _ [] = []
apagarEnquanto f (a:b)  | (f a) = apagarEnquanto f b
                        | otherwise = (a:b)

par :: Int -> Bool
par a = (mod a 2) == 0

main = do
  print (apagarEnquanto par [2, 4, 6, 8, 3, 6, 2, 4])
  print (apagarEnquanto par [1, 4, 6, 8, 3, 6, 2, 4])
