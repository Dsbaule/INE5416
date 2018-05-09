module Produtos (produtos) where

import System.IO

switchState :: String -> IO()
switchState "1" = do
    (relatorioProdutos)
    (produtos)
switchState "2" = do
    (adicionaProduto)
    (produtos)
switchState "3" = (produtos)
switchState "4" = (produtos)
switchState "5" = putStrLn "\nVoltando..."
switchState _ = do
    putStrLn "\nOpção Inválida!"
    (produtos)

relatorioProdutos :: IO()
relatorioProdutos = do
    putStrLn "\nRelatorio de Produtos:"
    putStrLn "1 - Relatório completo"
    putStrLn "2 - Adicionar Produto"
    putStrLn "3 - Alterar Produto"
    putStrLn "4 - Remover Produto"
    putStrLn "5 - Voltar"
    input <- getLine
    (switchStaterelatorioProdutos input)

switchStaterelatorioProdutos :: String -> IO()
switchStaterelatorioProdutos "1" = (relatorioCompleto)
switchStaterelatorioProdutos "2" = (produtos)
switchStaterelatorioProdutos "3" = (produtos)
switchStaterelatorioProdutos "4" = (produtos)
switchStaterelatorioProdutos "5" = putStrLn "\nVoltando..."
switchStaterelatorioProdutos _ = do
    putStrLn "\nOpção Inválida!"
    (produtos)

relatorioCompleto :: IO()
relatorioCompleto = do
    f <- readFile "produto.db"
    putStrLn ""
    putStrLn f

adicionaProduto :: IO()
adicionaProduto = do
    hSetBuffering stdout NoBuffering
    putStr "\nCodigo = "
    input <- getLine
    appendFile "produto.db" input
    appendFile "produto.db" ",\""
    putStr "Nome = "
    input <- getLine
    appendFile "produto.db" input
    appendFile "produto.db" "\","
    putStr "Quantidade em estoque = "
    input <- getLine
    appendFile "produto.db" input
    appendFile "produto.db" ","
    putStr "Preço unitário (ou por kilo) = "
    input <- getLine
    appendFile "produto.db" input
    appendFile "produto.db" "\n"

produtos = do
    putStrLn "\nManipular Produtos:"
    putStrLn "1 - Relatório de produtos"
    putStrLn "2 - Adicionar Produto"
    putStrLn "3 - Alterar Produto"
    putStrLn "4 - Remover Produto"
    putStrLn "5 - Voltar"
    input <- getLine
    (switchState input)
