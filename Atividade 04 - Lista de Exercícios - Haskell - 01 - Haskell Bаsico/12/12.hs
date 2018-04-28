mdc2 :: Int -> Int -> Int
mdc2 a 0 = a
mdc2 a b = (mdc2 b (mod a b))

mdc3 :: Int -> Int -> Int -> Int
mdc3 a b c = mdc2 (mdc2 b (mod a b)) c

main = do
  print "Numeros:"
  nString <- getLine
  let a = (read nString :: Int)
  nString <- getLine
  let b = (read nString :: Int)
  nString <- getLine
  let c = (read nString :: Int)
  print (mdc3 a b c)
