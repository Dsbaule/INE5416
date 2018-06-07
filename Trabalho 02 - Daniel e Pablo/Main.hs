module Main (main) where

-- Importação de Pacotes
import System.IO

-- Importação dos Pacotes de Dados
import Clientes
import Produtos
import Vendas
import ItensVenda

-- Importação dos Pacotes de Operação
import Coerencia
import Relatorios
import Remocao

main = do
    (menuPrincipal)

menuPrincipal :: IO()
menuPrincipal = do
    putStrLn "\nSelecione a opcao desejada:"
    putStrLn "1 - Cliente"
    putStrLn "2 - Produto"
    putStrLn "3 - Venda"
    putStrLn "4 - Verifica Coerencia"
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
selecaoMenuPrincipal "4" = do
    verificaCoerencia
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
    menuRelatorioDeClientes
    menuCliente
selecaoMenuCliente "S" = do
    putStrLn "Voltando..."
selecaoMenuCliente _ = do
    putStrLn "Opcao Invalida"
    menuCliente

menuRelatorioDeClientes :: IO()
menuRelatorioDeClientes = do
    putStrLn "\nRelatorio de Clientes:"
    putStrLn "1 - Relatorio Completo"
    putStrLn "2 - Relatorio de Clientes que mais compraram"
    putStrLn "S - Voltar"
    r <- getLine
    selecaoMenuRelatorioDeClientes r

selecaoMenuRelatorioDeClientes :: String -> IO()
selecaoMenuRelatorioDeClientes "1" = do
    relatorioDeClientes
    menuRelatorioDeClientes
selecaoMenuRelatorioDeClientes "2" = do
    relatorioDeClientesQueMaisCompraram
    menuRelatorioDeClientes
selecaoMenuRelatorioDeClientes "S" = do
    putStrLn "Voltando..."
selecaoMenuRelatorioDeClientes _ = do
    putStrLn "Opcao Invalida"
    menuRelatorioDeClientes

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
    menuRelatorioDeProdutos
    menuProduto
selecaoMenuProduto "S" = do
    putStrLn "Voltando..."
selecaoMenuProduto _ = do
    putStrLn "Opcao Invalida"
    menuProduto

menuRelatorioDeProdutos :: IO()
menuRelatorioDeProdutos = do
    putStrLn "\nRelatorio de Produtos:"
    putStrLn "1 - Relatorio Completo"
    putStrLn "2 - Relatorio de Produtos mais vendidos"
    putStrLn "S - Voltar"
    r <- getLine
    selecaoMenuRelatorioDeProdutos r

selecaoMenuRelatorioDeProdutos :: String -> IO()
selecaoMenuRelatorioDeProdutos "1" = do
    relatorioDeProdutos
    menuRelatorioDeProdutos
selecaoMenuRelatorioDeProdutos "2" = do
    relatorioDeProdutosMaisVendidos
    menuRelatorioDeProdutos
selecaoMenuRelatorioDeProdutos "S" = do
    putStrLn "Voltando..."
selecaoMenuRelatorioDeProdutos _ = do
    putStrLn "Opcao Invalida"
    menuRelatorioDeProdutos

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
    menuRegistrarVenda
    menuVenda
selecaoMenuVenda "2" = do
    menuRelatorioVenda
    menuVenda
selecaoMenuVenda "S" = do
    putStrLn "Voltando..."
selecaoMenuVenda _ = do
    putStrLn "Opcao Invalida"
    menuVenda

menuRegistrarVenda :: IO()
menuRegistrarVenda = do
    putStrLn "\nRegistrar venda:"
    putStrLn "1 - Registrar nova Venda"
    putStrLn "2 - Registrar item de venda"
    putStrLn "S - Voltar"
    r <- getLine
    selecaoMenuRegistrarVenda r

selecaoMenuRegistrarVenda :: String -> IO()
selecaoMenuRegistrarVenda "1" = do
    registrarVenda
    menuRegistrarVenda
selecaoMenuRegistrarVenda "2" = do
    registrarItemVenda
    menuRegistrarVenda
selecaoMenuRegistrarVenda "S" = do
    putStrLn "Voltando..."
selecaoMenuRegistrarVenda _ = do
    putStrLn "Opcao Invalida"
    menuRegistrarVenda

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
