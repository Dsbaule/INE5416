fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

main = do
  nString <- getLine
  let n = (read nString :: Int)
  print (fib n)
