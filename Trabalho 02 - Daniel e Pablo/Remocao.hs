module Remocao where

-- Importação de Pacotes
import System.IO

-- Importação dos Pacotes Locais
import Clientes
import Produtos
import Vendas
import ItensVenda

removerCliente :: IO()
removerCliente = do
    putStrLn "\nClientes (Codigo - Nome - Cidade - Idade - Sexo):"

    stringClientes <- leArquivoClientes
    let listaClientes = getListaClientes stringClientes

    printClientes listaClientes

    putStrLn "\nCodigo do cliente a remover: "
    input <- getLine
    let codigo = (read input :: Clientes.Codigo)

    stringVendas <- leArquivoVendas
    let listaVendas = getListaVendas stringVendas

    if (clienteTemVenda codigo listaVendas)
        then putStrLn "\nCliente tem Vendas, não pode ser removido!"
        else if (existeCliente codigo listaClientes)
            then do
                let novaListaClientes = (removeCliente listaClientes codigo)
                printClientes novaListaClientes
                overwriteClientes novaListaClientes
                putStrLn "\nCliente removido.\n"
            else putStrLn "\nCliente inexistente!"

clienteTemVenda :: CodigoCliente -> [Venda] -> Bool
clienteTemVenda _ [] = False
clienteTemVenda c (v:vr) = (c == (Vendas.getCodigoCliente v)) || (clienteTemVenda c vr)

removerProduto :: IO()
removerProduto = do
    putStrLn "\nProdutos (Codigo - Nome - Quantidade - Preco):"

    stringProdutos <- leArquivoProdutos
    let listaProdutos = getListaProdutos stringProdutos

    printProdutos listaProdutos

    putStrLn "\nCodigo do produto a remover: "
    input <- getLine
    let codigo = (read input :: CodigoProduto)

    stringItensVenda <- leArquivoItensVenda
    let listaItensVenda = getListaItensVenda stringItensVenda

    if (produtoTemVenda codigo listaItensVenda)
        then putStrLn "\nProduto tem Vendas, não pode ser removido!"
        else if (existeProduto codigo listaProdutos)
            then do
                let novaListaProdutos = (removeProduto listaProdutos codigo)
                printProdutos novaListaProdutos
                overwriteProdutos novaListaProdutos
                putStrLn "\nProduto removido.\n"
            else putStrLn "\nProduto inexistente!"

produtoTemVenda :: CodigoProduto -> [ItemVenda] -> Bool
produtoTemVenda _ [] = False
produtoTemVenda c (i:ir) = (c == (getCodigoProduto i)) || (produtoTemVenda c ir)
