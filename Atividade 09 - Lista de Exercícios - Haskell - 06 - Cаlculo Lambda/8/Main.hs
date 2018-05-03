module Main (main) where

import WriteContact
import ShowContacts

callprogram :: String -> IO()
callprogram "1" = do
    putStrLn ""
    (showContacts)
    (main)
callprogram "2" = do
    putStrLn ""
    (writeContact)
    (main)
callprogram "3" = do
    (putStrLn "\nSaindo")
callprogram _ = do
    (putStrLn "\nOpcao Invalida")
    (main)

main = do
    putStrLn "\nSelecione a Opcao"
    putStrLn "1 - Mostrar Contatos"
    putStrLn "2 - Novo Contato"
    putStrLn "3 - Sair"
    input <- getLine
    (callprogram input)
