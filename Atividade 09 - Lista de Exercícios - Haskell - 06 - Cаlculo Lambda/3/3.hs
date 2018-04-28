import Data.Function

fibonacci :: Int -> Int
fibonacci = fix (\f n -> if n == 0 then 0 else if n == 1 then 1 else ((f (n - 1)) + (f (n - 2))))

main = do
    print (fibonacci 5)
    print (fibonacci 8)
