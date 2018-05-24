module Produto where

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

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

printProdutos :: [Produto] -> IO()
printProdutos [] = putStr ""
printProdutos (c:l) = do
    printProduto c
    printProdutos l

printProduto :: Produto -> IO()
printProduto (cod, nome, quantidade, preco) = putStrLn ((show cod) ++ " - " ++ nome ++ (show quantidade) ++ (show preco))

converteStringsProdutos :: [String] -> [Produto]
converteStringsProdutos [] = []
converteStringsProdutos (p:l) = (converteStringProduto p) : (converteStringsProdutos l)

converteStringProduto :: String -> Produto
converteStringProduto = read

converteProdutosStrings :: [Produto] -> [String]
converteProdutosStrings [] = []
converteProdutosStrings (p:l) = (converteProdutoString p) : (converteProdutosStrings l)

converteProdutoString :: Produto -> String
converteProdutoString = show
