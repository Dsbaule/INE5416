main = do
    nString <- getLine
    let n1 = (read nString :: Float)
    nString <- getLine
    let n2 = (read nString :: Float)
    nString <- getLine
    let n3 = (read nString :: Float)
    print ((\x -> if (x >= 6) then True else False) ((\n1 n2 n3 -> (n1 + n2 + n3)/3) n1 n2 n3))
