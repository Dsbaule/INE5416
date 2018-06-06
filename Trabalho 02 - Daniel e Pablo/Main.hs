module Main (main) where

-- Importação de Pacotes
import System.IO

-- Importação dos Pacotes Locais
import Clientes

main = do
    stringClientes <- leArquivoClientes
    let listaClientes = getListaClientes stringClientes
    printClientes listaClientes
