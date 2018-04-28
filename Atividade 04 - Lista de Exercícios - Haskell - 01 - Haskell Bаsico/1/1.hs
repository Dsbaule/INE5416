
potencia :: Int -> Int -> Int
potencia x 1 = x
potencia x y = x * potencia x (y - 1)

main = do
  nString <- getLine
  let x = (read nString :: Int)
  nString <- getLine
  let y = (read nString :: Int)
  print (potencia x y)
