main = do
    nString <- getLine
    let a = (read nString :: Float)
    nString <- getLine
    let b = (read nString :: Float)
    nString <- getLine
    let c = (read nString :: Float)
    print ((\a b c -> if (a >= b) then if (a >= c) then a else c else if (b >= c) then b else c) a b c)
