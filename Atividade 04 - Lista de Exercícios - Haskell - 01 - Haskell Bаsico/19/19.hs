conjGold :: Int -> Int
conjGold 0 = 0
conjGold 1 = 1
conjGold n = conjGoldRec (getPrimos n) (getPrimos n) n

conjGoldRec :: [Int] -> [Int] -> Int -> Int
conjGoldRec [] _ _ = 0
conjGoldRec (a:b) [] x = conjGoldRec b b x
conjGoldRec (a:b) (c:d) x   | ((a + c) == x) = a
                            | ((a + c) < x) = conjGoldRec b b x
                            | otherwise = conjGoldRec (a:b) d x

getPrimos :: Int -> [Int]
getPrimos 0 = []
getPrimos 1 = []
getPrimos n | (primo n) = n : (getPrimos (n - 1))
            | otherwise = getPrimos (n - 1)

primo :: Int -> Bool
primo n = primoR n 2

primoR :: Int -> Int -> Bool
primoR n r  | (r >= n) = True
            | otherwise = (not ((mod n r) == 0)) && (primoR n (r + 1))

main = do
  print "Numero:"
  nString <- getLine
  let n = (read nString :: Int)
  print (conjGold n)
