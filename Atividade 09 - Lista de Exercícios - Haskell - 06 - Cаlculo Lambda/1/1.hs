main = do
    print ((\x y -> ((x || y) && (not (x && y)))) False False)
    print ((\x y -> ((x || y) && (not (x && y)))) False True)
    print ((\x y -> ((x || y) && (not (x && y)))) True False)
    print ((\x y -> ((x || y) && (not (x && y)))) True True)
