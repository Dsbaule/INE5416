convertBool :: Int -> Bool
convertBool x | (x == 0) = False
              | (x == 1) = True
              | otherwise = True

xor :: Bool -> Bool -> Bool
xor x y = (x || y) && (not (x && y))

main = do
  nString <- getLine
  let a = (convertBool (read nString :: Int))
  nString <- getLine
  let b = (convertBool (read nString :: Int))
  print (xor a b)
