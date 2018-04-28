media :: Float -> Float -> Float -> Float
media x y z = (x + y + z)/3

aprovado :: Float -> String
aprovado x = if x >= 6
    then
        "aprovado"
    else
        "reprovado"

main = do
    nString <- getLine
    let nota1 = (read nString :: Float) 
    nString <- getLine
    let nota2 = (read nString :: Float) 
    nString <- getLine
    let nota3 = (read nString :: Float) 
    print (aprovado (media nota1 nota2 nota3))