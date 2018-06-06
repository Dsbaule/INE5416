module Main (main) where

-- Importação de Pacotes
import System.IO

-- Importação dos Pacotes Locais
import Clientes
import Produtos

main = do
    -- Inicialização dos dados (listas)
    -- Clientes:
    stringClientes <- leArquivoClientes
    let listaClientes = getListaClientes stringClientes
    -- Produtos:
    stringProdutos <- leArquivoProdutos
    let listaProdutos = getListaProdutos stringProdutos

    printClientes listaClientes
    printProdutos listaProdutos
