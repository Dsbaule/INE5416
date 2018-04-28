maior :: Float -> Float -> Float -> Float
maior a b c | (a >= b) && (a >= c) = a
            | (b >= a) && (b >= c) = b
            | otherwise = c

main = do
  print "Numeros:"
  nString <- getLine
  let a = (read nString :: Float)
  nString <- getLine
  let b = (read nString :: Float)
  nString <- getLine
  let c = (read nString :: Float)
  print (maior a b c)
