module ShowContacts (showContacts) where

showContacts :: IO()
showContacts = do
    f <- readFile "contatos.txt"
    putStrLn     f
