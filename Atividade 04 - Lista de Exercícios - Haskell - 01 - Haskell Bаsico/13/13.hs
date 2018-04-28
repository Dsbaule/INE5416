mdc :: Int -> Int -> Int
mdc a 0 = a
mdc a b = (mdc b (mod a b))

mmc :: Int -> Int -> Int
mmc a b = a * (div b (mdc a b))

main = do
  print "Numeros:"
  nString <- getLine
  let a = (read nString :: Int)
  nString <- getLine
  let b = (read nString :: Int)
  print (mmc a b)
