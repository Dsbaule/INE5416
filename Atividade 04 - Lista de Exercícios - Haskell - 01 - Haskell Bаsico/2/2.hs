valorAbsoluto :: Int -> Int
valorAbsoluto x = if x < 0
  then
    -x
  else
    x

main = do
  nString <- getLine
  let x = (read nString :: Int)
  print (valorAbsoluto x)
