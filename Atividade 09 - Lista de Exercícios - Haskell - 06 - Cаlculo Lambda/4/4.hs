main = do
    nString <- getLine
    let a = (read nString :: Float)
    nString <- getLine
    let b = (read nString :: Float)
    nString <- getLine
    let c = (read nString :: Float)
    print ((\a b c -> (((sqrt ((b * b) - (4 * a * c))) - b)/(2 * a))) a b c)
    print ((\a b c -> (( 0 - (sqrt ((b * b) - (4 * a * c))) - b)/(2 * a))) a b c)
