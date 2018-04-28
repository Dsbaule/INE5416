divisivel :: Int -> Int -> Bool
divisivel x y = ((mod x y) == 0)

main = do
  print "Numeros:"
  nString <- getLine
  let x = (read nString :: Int)
  nString <- getLine
  let y = (read nString :: Int)
  print (divisivel x y)
