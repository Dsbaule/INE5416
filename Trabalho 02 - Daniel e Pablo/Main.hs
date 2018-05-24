module Main (main) where

-- Importação de Pacotes
import System.IO

-- Importação dos Pacotes Locais
import Cliente
import Produto
import Venda

main = do
    (menuPrincipal)

menuPrincipal :: IO()
menuPrincipal = do
    putStrLn "Selecione a opcao desejada:"
    putStrLn "1 - Cliente"
    putStrLn "2 - Produto"
    putStrLn "3 - Venda"
    putStrLn "S - Sair"
    r <- getLine
    selecaoMenuPrincipal r

selecaoMenuPrincipal :: String -> IO()
selecaoMenuPrincipal "1" = do
    menuCliente
    menuPrincipal
selecaoMenuPrincipal "2" = do
    --menuProduto
    menuPrincipal
selecaoMenuPrincipal "3" = do
    --menuVenda
    menuPrincipal
selecaoMenuPrincipal "S" = do
    putStrLn "Saindo..."
selecaoMenuPrincipal _ = do
    putStrLn "Opcao Invalida"

menuCliente :: IO()
menuCliente = do
    putStrLn "Cliente:"
    putStrLn "1 - Adicionar Cliente"
    putStrLn "2 - Remover Cliente"
    putStrLn "3 - Alterar Cliente"
    putStrLn "4 - Relatorio de Clientes"
    putStrLn "S - Voltar"
    r <- getLine
    selecaoMenuCliente r

selecaoMenuCliente :: String -> IO()
selecaoMenuCliente "1" = do
    adicionarCliente
    menuPrincipal
selecaoMenuCliente "2" = do
    --adicionarCliente
    menuPrincipal
selecaoMenuCliente "3" = do
    --alterarCliente
    menuPrincipal
selecaoMenuCliente "4" = do
    relatorioDeClientes
    menuPrincipal
selecaoMenuCliente "S" = do
    putStrLn "Saindo..."
selecaoMenuCliente _ = do
    putStrLn "Opcao Invalida"


-- Leitura das Listas
readData :: IO()
readData = do
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
    -- Impressão dos dados
    print listaClientes
    print listaProdutos
    print listaVendas
