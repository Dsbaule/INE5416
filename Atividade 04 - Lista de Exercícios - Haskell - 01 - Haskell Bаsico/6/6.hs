triangulo :: Int -> Int -> Int -> String
triangulo x y z | (x >= (y + z)) = "Nao"
                | (y >= (x + z)) = "Nao"
                | (z >= (x + y)) = "Nao"
                | otherwise = "Sim"

main = do
    nString <- getLine
    let x = (read nString :: Int)
    nString <- getLine
    let y = (read nString :: Int)
    nString <- getLine
    let z = (read nString :: Int)
    print (triangulo x y z)