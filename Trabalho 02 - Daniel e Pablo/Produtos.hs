module Produtos where

-- Importação de Pacotes
import System.IO

-- Produto composto por: Codigo, Nome, Quantidade em estoque, Preço unitário ou por Kilo
type Codigo     = Int
type Nome       = String
type Quantidade = Int
type Preco      = Float

type Produto = (Codigo, Nome, Quantidade, Preco)

--------------------------------------------------------------------------------
------------------------------- Funções de Dados -------------------------------
--------------------------------------------------------------------------------

getCodigo :: Produto -> Codigo
getCodigo (cod, nome, quantidade, preco) =  cod

getNome :: Produto -> Nome
getNome (cod, nome, quantidade, preco) =  nome

getQuantidade :: Produto -> Quantidade
getQuantidade (cod, nome, quantidade, preco) =  quantidade

getPreco :: Produto -> Preco
getPreco (cod, nome, quantidade, preco) =  preco

--------------------------------------------------------------------------------
------------------------------ Funções Principais ------------------------------
--------------------------------------------------------------------------------

getListaProdutos :: String -> [Produto]
getListaProdutos = converteStringProdutos

leArquivoProdutos :: IO String
leArquivoProdutos = do
    x <- openFile "produto.db" ReadMode
    hGetContents x

adicionarProduto :: IO()
adicionarProduto = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nAdicionar Produto:"
    putStr "\nCodigo = "
    input <- getLine
    let codigo = (read input :: Codigo)
    putStr "Nome = "
    input <- getLine
    let nome = (read $ show input :: Nome)
    putStr "Quantidade = "
    input <- getLine
    let quantidade = (read input :: Quantidade)
    putStr "Preco = "
    input <- getLine
    let preco = (read input :: Preco)
    writeNewProduto (codigo, nome, quantidade, preco)
    putStrLn "\nProduto adicionado."

removerProduto :: IO()
removerProduto = do
    putStrLn "\nProdutos (Codigo - Nome - Quantidade - Preco):"
    stringProdutos <- leArquivoProdutos
    let listaProdutos = getListaProdutos stringProdutos
    printProdutos listaProdutos
    putStrLn "\nCodigo do produto a remover: "
    input <- getLine
    let codigo = (read input :: Codigo)
    let novaListaProdutos = (removeProduto listaProdutos codigo)
    printProdutos novaListaProdutos
    overwriteProdutos novaListaProdutos

alterarProduto :: IO()
alterarProduto = do
    putStrLn "\nProdutos (Codigo - Nome - Quantidade - Preco):"
    stringProdutos <- leArquivoProdutos
    let listaProdutos = getListaProdutos stringProdutos
    printProdutos listaProdutos
    putStr "\nCodigo do produto a alterar: "
    input <- getLine
    let codigo = (read input :: Codigo)
    putStrLn "\nDigite os novos dados: "
    putStr "\tNome = "
    input <- getLine
    let nome = (read $ show input :: Nome)
    putStr "\tQuantidade = "
    input <- getLine
    let quantidade = (read input :: Quantidade)
    putStr "\tPreco = "
    input <- getLine
    let preco = (read input :: Preco)
    let novaListaProdutos = (removeProduto listaProdutos codigo)
    overwriteProdutos novaListaProdutos
    writeNewProduto (codigo, nome, quantidade, preco)

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

converteStringProdutos :: String -> [Produto]
converteStringProdutos = converteStringsProdutos . lines

converteStringsProdutos :: [String] -> [Produto]
converteStringsProdutos [] = []
converteStringsProdutos (p:l) = (converteStringProduto p) : (converteStringsProdutos l)

converteStringProduto :: String -> Produto
converteStringProduto = read

converteProdutosString :: [Produto] -> String
converteProdutosString [] = ""
converteProdutosString (p:l) = (converteProdutoString p) ++ (converteProdutosString l)

converteProdutoString :: Produto -> String
converteProdutoString (codigo, nome, quantidade, preco) = ("(" ++ (show codigo) ++ "," ++ (show nome) ++ ","  ++ (show quantidade) ++ ","  ++ (show preco) ++ ")\n")

removeProduto :: [Produto] -> Codigo -> [Produto]
removeProduto [] _ = []
removeProduto (a:b) c   | ((getCodigo a) == c) = b
                        | otherwise = a : (removeProduto b c)

overwriteProdutos :: [Produto] -> IO()
overwriteProdutos c = do
    x <- openFile "produto.db" WriteMode
    hPutStr x (converteProdutosString c)
    hClose x

writeNewProduto :: Produto -> IO()
writeNewProduto c = do
    x <- openFile "produto.db" AppendMode
    hPutStr x (converteProdutoString c)
    hClose x

existeProduto :: Codigo -> [Produto] -> Bool
existeProduto _ [] = False
existeProduto c (p:pr) = (c == (getCodigo p)) || (existeProduto c pr)

getProduto :: Codigo -> [Produto] -> Produto
getProduto c (p:pr) | (c == (getCodigo p)) = p
                    | otherwise = getProduto c pr

--------------------------------------------------------------------------------
----------------------- Funções para Impressão de Dados ------------------------
--------------------------------------------------------------------------------

printProdutos :: [Produto] -> IO()
printProdutos [] = putStr ""
printProdutos (c:l) = do
    printProduto c
    printProdutos l

printProduto :: Produto -> IO()
printProduto (cod, nome, quantidade, preco) = putStrLn ((show cod) ++ " - " ++ nome ++ " - "  ++ (show quantidade) ++ " - " ++ (show preco))
