mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = (mdc b (mod a b))

cop :: Int -> Int -> Bool
cop a b = ((mdc a b) == 1)

main = do
  print "Numeros:"
  nString <- getLine
  let a = (read nString :: Int)
  nString <- getLine
  let b = (read nString :: Int)
  print (cop a b)
