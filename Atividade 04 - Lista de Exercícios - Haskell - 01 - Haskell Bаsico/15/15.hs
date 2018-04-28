mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = (mdc b (mod a b))

cop :: Int -> Int -> Bool
cop a b = ((mdc a b) == 1)

totE :: Int -> Int
totE n = totER n 0

totER :: Int -> Int -> Int
totER n r | (n <= r) = 0
          | (cop n r) = 1 + (totER n (r + 1))
          | otherwise = (totER n (r + 1))

main = do
  print "Numeros:"
  nString <- getLine
  let n = (read nString :: Int)
  print (totE n)
