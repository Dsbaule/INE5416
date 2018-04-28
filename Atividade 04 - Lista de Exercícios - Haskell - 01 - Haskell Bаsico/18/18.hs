operacao :: Float -> String -> Float -> Float
operacao x op y | (op == "+") = x + y
                | (op == "-") = x - y
                | (op == "*") = x * y
                | otherwise = x / y

main = do
  print "Operacao:"
  nString <- getLine
  let x = (read nString :: Float)
  op <- getLine
  nString <- getLine
  let y = (read nString :: Float)
  print (operacao x op y)
