module Main (main) where

import Produtos

callprogram :: String -> IO()
callprogram "1" = do
    (produtos)
    (main)
callprogram "2" = do
    putStrLn ""
    (main)
callprogram "3" = do
    (putStrLn "\nSaindo")
callprogram "4" = do
    (putStrLn "\nOpcao Invalida")
    (main)
callprogram "5" = do
    (putStrLn "\nSaindo...")
callprogram _ = do
    (putStrLn "\nOpcao Invalida")
    (main)

main = do
    putStrLn "\nSelecione a Opcao Desejada"
    putStrLn "1 - Manipular Produtos"
    putStrLn "2 - Manipular Clientes"
    putStrLn "3 - Manipular Vendas"
    putStrLn "4 - Verificar Coerencia"
    putStrLn "5 - Sair"
    input <- getLine
    (callprogram input)
