mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = (mdc b (mod a b))

main = do
  print "Numeros:"
  nString <- getLine
  let a = (read nString :: Int)
  nString <- getLine
  let b = (read nString :: Int)
  print (mdc a b)
