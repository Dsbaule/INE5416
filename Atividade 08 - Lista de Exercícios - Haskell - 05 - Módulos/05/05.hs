{-
  Fixity define o nivel de precedencia de funções e operadores, ou seja, a ordem em que eles serão realizados na falta de especificação (parenteses)

  No exemplo abaixo, multiplicação tem precedencia a adição
-}

infixr  6 +++
infixr  7 ***

(+++) :: Int -> Int -> Int
a +++ b = a + b

(***) :: Int -> Int -> Int
a *** b = a * b

main = do
  print (1 +++ 2 *** 3)
  print (3 *** 2 +++ 1)
