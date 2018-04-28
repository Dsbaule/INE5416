baskp :: Float -> Float -> Float -> Float
baskp a b c = (0 - b + (sqrt (delta a b c))) / (2 * a)

baskn :: Float -> Float -> Float -> Float
baskn a b c = (0 - b - (sqrt (delta a b c))) / (2 * a)

delta :: Float -> Float -> Float -> Float
delta a b c = (b * b) - (4 * a * c)

main = do
  nString <- getLine
  let a = (read nString :: Float)
  nString <- getLine
  let b = (read nString :: Float)
  nString <- getLine
  let c = (read nString :: Float)

  print (baskp a b c)
  print (baskn a b c)
