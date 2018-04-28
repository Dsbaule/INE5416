main = do
    nString <- getLine
    let x1 = (read nString :: Float)
    nString <- getLine
    let y1 = (read nString :: Float)
    nString <- getLine
    let z1 = (read nString :: Float)
    nString <- getLine
    let x2 = (read nString :: Float)
    nString <- getLine
    let y2 = (read nString :: Float)
    nString <- getLine
    let z2 = (read nString :: Float)

    print ((\x1 y1 z1 x2 y2 z2 -> sqrt(((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)) + ((z1 - z2) * (z1 - z2)))) x1 y1 z1 x2 y2 z2)
