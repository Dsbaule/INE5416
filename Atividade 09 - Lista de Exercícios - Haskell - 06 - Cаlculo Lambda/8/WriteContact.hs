module WriteContact (writeContact) where

writeContact :: IO()
writeContact = do
    print("Nome:")
    input <- getLine
    (saveString input)
    (saveString "\t|\t")
    print("Idade:")
    input <- getLine
    (saveString input)
    (saveString "\t|\t")
    print("Sexo: (M/F)")
    input <- getLine
    (saveString input)
    (saveString "\t|\t")
    print("Email:")
    input <- getLine
    (saveString input)
    (saveString "\t|\t")
    print("Telefone:")
    input <- getLine
    (saveString input)
    (saveString "\n")
    (print "Contato Salvo")

saveString :: String -> IO()
saveString s = (appendFile "contatos.txt" s)
