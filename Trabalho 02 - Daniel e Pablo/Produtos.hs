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

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

converteStringProdutos :: String -> [Produto]
converteStringProdutos string = converteStringsProdutos (lines string)

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
