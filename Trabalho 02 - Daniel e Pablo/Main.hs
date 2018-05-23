module Main (main) where

-- Importação de Pacotes
import System.IO

-- Importação dos Pacotes Locais
import Cliente
import Produto
import Venda

main = do
    -- Le os clientes
    x <- openFile "cliente.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaClientes = converteStringsClientes fLines
    -- Le os produtos
    x <- openFile "produto.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaProdutos = converteStringsProdutos fLines
    -- Le as Vendas
    x <- openFile "venda.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaVendas = converteStringsVendas fLines

    print listaClientes
    print listaProdutos
    print listaVendas
