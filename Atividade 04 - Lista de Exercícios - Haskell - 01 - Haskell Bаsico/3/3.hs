main = do
  nString <- getLine
  let x = (read nString :: Int)
  nString <- getLine
  let y = (read nString :: Int)
  print (x * y)
