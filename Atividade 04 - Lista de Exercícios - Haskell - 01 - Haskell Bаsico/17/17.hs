primo :: Int -> Bool
primo n = primoR n 2

primoR :: Int -> Int -> Bool
primoR n r  | (r >= n) = True
            | otherwise = (not ((mod n r) == 0)) && (primoR n (r + 1))

main = do
  print "Numeros:"
  nString <- getLine
  let n = (read nString :: Int)
  print (primo n)
