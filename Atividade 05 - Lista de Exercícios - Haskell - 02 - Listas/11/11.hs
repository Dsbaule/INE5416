primeiros :: Int -> [t] -> [t]
primeiros 0 _ = []
primeiros n (a:b) = a : (primeiros (n-1) b)

main = do
  print (primeiros 3 [1,2,3,4,5,6,7,8,9,0])
