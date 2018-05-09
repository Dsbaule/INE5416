module Produtos (produtos) where

import System.IO

type Codigo = Int
type Nome = String
type Quantidade = Int
type Preco = Float
type Produto = (Codigo, Nome, Quantidade, Preco)

switchState :: String -> IO()
switchState "1" = do
    (relatorioProdutos)
    (produtos)
switchState "2" =  do
    (adicionaProduto)
    (produtos)
switchState _ = do
    putStrLn "\nOpção Inválida!"
    (produtos)

relatorioProdutos :: IO()
relatorioProdutos = do
    putStrLn "\nRelatorio de Produtos:"
    putStrLn "1 - Relatório completo"
    putStrLn "2 - Adicionar Produto"
    --putStrLn "3 - Alterar Produto"
    --putStrLn "4 - Remover Produto"
    putStrLn "5 - Voltar"
    input <- getLine
    (switchStaterelatorioProdutos input)

switchStaterelatorioProdutos :: String -> IO()
switchStaterelatorioProdutos "1" = (relatorioCompleto)
switchStaterelatorioProdutos "5" = putStrLn "\nVoltando..."
switchStaterelatorioProdutos _ = do
    putStrLn "\nOpção Inválida!"
    (produtos)

relatorioCompleto :: IO()
relatorioCompleto = do
    putStr "\nRelatorio de Produtos:\n(CODIGO | NOME | QTD | PRECO):\n\n"
    productHandle <- openFile "produto.db" ReadMode
    (printProdutos productHandle)
    hClose productHandle

printProdutos :: Handle -> IO()
printProdutos pHandle = do
    peof <- hIsEOF pHandle
    if peof
        then return ()
        else do
            input <- hGetLine pHandle
            let codigoProduto = (read input :: Codigo)
            input <- hGetLine pHandle
            let nomeProduto = (read input :: Nome)
            input <- hGetLine pHandle
            let quantidadeProduto = (read input :: Quantidade)
            input <- hGetLine pHandle
            let precoProduto = (read input :: Preco)
            (printProduto (codigoProduto, nomeProduto, quantidadeProduto, precoProduto))
            (printProdutos pHandle)

printProduto :: Produto -> IO()
printProduto (codigo, nome, quantidade, preco) = do
    putStrLn ((show codigo) ++ " | " ++ nome ++ " | " ++ (show quantidade) ++ " | " ++ (show preco))

adicionaProduto :: IO()
adicionaProduto = do
    hSetBuffering stdout NoBuffering
    putStr "\nCodigo = "
    input <- getLine
    let codigoProduto = (read input :: Codigo)
    putStr "Nome = "
    input <- getLine
    let nomeProduto = (read input)
    putStr "Quantidade em estoque = "
    input <- getLine
    let quantidadeProduto = (read input :: Quantidade)
    putStr "Preço unitário (ou por kilo) = "
    input <- getLine
    let precoProduto = (read input :: Preco)
    productHandle <- openFile "produto.db" AppendMode
    (salvaProduto productHandle (codigoProduto, nomeProduto, quantidadeProduto, precoProduto))
    hClose productHandle

salvaProduto :: Handle -> Produto -> IO()
salvaProduto pHandle (codigo, nome, quantidade, preco) = do
    putStrLn "\nAdicionando produto!\n"
    hPutStrLn pHandle (show codigo)
    hPutStrLn pHandle nome
    hPutStrLn pHandle (show quantidade)
    hPutStrLn pHandle (show preco)
    putStrLn "\nProduto adicionado!\n"


produtos = do
    putStrLn "\nManipular Produtos:"
    putStrLn "1 - Relatório de produtos"
    putStrLn "2 - Adicionar Produto"
    putStrLn "3 - Alterar Produto"
    putStrLn "4 - Remover Produto"
    putStrLn "5 - Voltar"
    input <- getLine
    (switchState input)
