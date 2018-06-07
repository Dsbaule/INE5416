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
    putStrLn "\nSelecione a opcao desejada:"
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
    menuProduto
    menuPrincipal
selecaoMenuPrincipal "3" = do
    menuVenda
    menuPrincipal
selecaoMenuPrincipal "S" = do
    putStrLn "Saindo..."
selecaoMenuPrincipal _ = do
    putStrLn "Opcao Invalida"
    menuPrincipal

menuCliente :: IO()
menuCliente = do
    putStrLn "\nCliente:"
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
    menuCliente
selecaoMenuCliente "2" = do
    removerCliente
    menuCliente
selecaoMenuCliente "3" = do
    alterarCliente
    menuCliente
selecaoMenuCliente "4" = do
    relatorioDeClientes
    menuCliente
selecaoMenuCliente "S" = do
    putStrLn "Voltando..."
selecaoMenuCliente _ = do
    putStrLn "Opcao Invalida"
    menuCliente

menuProduto :: IO()
menuProduto = do
    putStrLn "\nProduto:"
    putStrLn "1 - Adicionar Produto"
    putStrLn "2 - Remover Produto"
    putStrLn "3 - Alterar Produto"
    putStrLn "4 - Relatorio de Produtos"
    putStrLn "S - Voltar"
    r <- getLine
    selecaoMenuProduto r

selecaoMenuProduto :: String -> IO()
selecaoMenuProduto "1" = do
    adicionarProduto
    menuProduto
selecaoMenuProduto "2" = do
    removerProduto
    menuProduto
selecaoMenuProduto "3" = do
    alterarProduto
    menuProduto
selecaoMenuProduto "4" = do
    relatorioDeProdutos
    menuProduto
selecaoMenuProduto "S" = do
    putStrLn "Voltando..."
selecaoMenuProduto _ = do
    putStrLn "Opcao Invalida"
    menuProduto

menuVenda :: IO()
menuVenda = do
    putStrLn "\nVenda:"
    putStrLn "1 - Registrar Venda"
    putStrLn "2 - Relatorio de Vendas"
    putStrLn "S - Voltar"
    r <- getLine
    selecaoMenuVenda r

selecaoMenuVenda :: String -> IO()
selecaoMenuVenda "1" = do
    --registrarVenda
    menuVenda
selecaoMenuVenda "2" = do
    menuRelatorioVenda
    menuVenda
selecaoMenuVenda "S" = do
    putStrLn "Voltando..."
selecaoMenuVenda _ = do
    putStrLn "Opcao Invalida"
    menuVenda

menuRelatorioVenda :: IO()
menuRelatorioVenda = do
    putStrLn "\nRelatorio de Vendas:"
    putStrLn "1 - Relatorio por Intervalo"
    putStrLn "2 - Relatorio por Cliente"
    putStrLn "3 - Relatorio Completo"
    putStrLn "S - Voltar"
    r <- getLine
    selecaoMenuRelatorioVenda r

selecaoMenuRelatorioVenda :: String -> IO()
selecaoMenuRelatorioVenda "1" = do
    relatorioDeVendasIntervalo
    menuRelatorioVenda
selecaoMenuRelatorioVenda "2" = do
    relatorioDeVendasCliente
    menuRelatorioVenda
selecaoMenuRelatorioVenda "3" = do
    relatorioDeVendasCompleto
    menuRelatorioVenda
selecaoMenuRelatorioVenda "S" = do
    putStrLn "Voltando..."
selecaoMenuRelatorioVenda _ = do
    putStrLn "Opcao Invalida"
    menuRelatorioVenda
