module ItensVenda where

-- Importação de Pacotes
import System.IO

import Vendas

-- Item de venda composto por: Codigo venda, Codigo item, Codigo produto, Preço unitário, Percentual Desconto, Quantidade, Total item
type CodigoItem         = Int
type CodigoProduto      = Int
type PrecoUnitario      = Float
type PercentualDesconto = Int
type Quantidade         = Int
type TotalItem          = Float

type ItemVenda = (CodigoVenda, CodigoItem, CodigoProduto, PrecoUnitario, PercentualDesconto, Quantidade, TotalItem)

--------------------------------------------------------------------------------
------------------------------- Funções de Dados -------------------------------
--------------------------------------------------------------------------------

getCodigoVenda :: ItemVenda -> CodigoVenda
getCodigoVenda (codigovenda, _, _, _, _, _, _) = codigovenda

getCodigoCliente :: ItemVenda -> CodigoItem
getCodigoCliente (_, codigoitem, _, _, _, _, _) = codigoitem

getCodigoProduto :: ItemVenda -> CodigoProduto
getCodigoProduto (_, _, codigoproduto, _, _, _, _) = codigoproduto

getPrecoUnitario :: ItemVenda -> PrecoUnitario
getPrecoUnitario (_, _, _, precounitario, _, _, _) = precounitario

getPercentualDesconto :: ItemVenda -> PercentualDesconto
getPercentualDesconto (_, _, _, _, percentualdesconto, _, _) = percentualdesconto

getQuantidade :: ItemVenda -> Quantidade
getQuantidade (_, _, _, _, _, quantidade, _) = quantidade

getTotal :: ItemVenda -> TotalItem
getTotal (_, _, _, _, _, _, totalitem) = totalitem

--------------------------------------------------------------------------------
------------------------------ Funções Principais ------------------------------
--------------------------------------------------------------------------------

getListaItensVenda :: String -> [ItemVenda]
getListaItensVenda = converteStringItensVenda

leArquivoItensVenda :: IO String
leArquivoItensVenda = do
    x <- openFile "itemvenda.db" ReadMode
    hGetContents x

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

converteStringItensVenda :: String -> [ItemVenda]
converteStringItensVenda = converteStringsItensVenda . lines

converteStringsItensVenda :: [String] -> [ItemVenda]
converteStringsItensVenda [] = []
converteStringsItensVenda (v:l) = (converteStringItemVenda v) : (converteStringsItensVenda l)

converteStringItemVenda :: String -> ItemVenda
converteStringItemVenda = read

--------------------------------------------------------------------------------
----------------------- Funções para Impressão de Dados ------------------------
--------------------------------------------------------------------------------

printItensVenda :: [ItemVenda] -> IO()
printItensVenda [] = putStr ""
printItensVenda (c:l) = do
    printItemVenda c
    printItensVenda l

printItemVenda :: ItemVenda -> IO()
printItemVenda (codigovenda, codigoitem, codigoproduto, precounitario, percentualdesconto, quantidade, totalitem) = do
    putStrLn ((show codigovenda) ++ " - " ++ (show codigoitem) ++ " - " ++ (show codigoproduto) ++ " - R$" ++ (show precounitario) ++ " - " ++ (show percentualdesconto) ++ "% - " ++ (show quantidade) ++ " - R$" ++ (show totalitem))
