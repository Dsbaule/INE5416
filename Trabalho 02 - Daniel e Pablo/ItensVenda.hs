module ItensVenda where

-- Importação de Pacotes
import System.IO

import Vendas
import Produtos

-- Item de venda composto por: Codigo venda, Codigo item, Codigo produto, Preço unitário, Percentual Desconto, Quantidade, Total item
type CodigoItem         = Int
type CodigoProduto      = Int
type PrecoUnitario      = Float
type PercentualDesconto = Int
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

registrarItemVenda :: IO()
registrarItemVenda = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nAdicionar Item de Venda:"
    putStr "Codigo da Venda = "
    input <- getLine
    let codigoVenda = (read input :: CodigoVenda)
    putStr "Codigo do Item = "
    input <- getLine
    let codigoItem = (read input :: CodigoItem)
    putStr "Codigo do Produto = "
    input <- getLine
    let codigoProduto = (read input :: CodigoProduto)
    putStr "Percentual do Desconto = "
    input <- getLine
    let percentualDesconto = (read input :: PercentualDesconto)
    putStr "Quantidade = "
    input <- getLine
    let quantidade = (read input :: Quantidade)

    stringVendas <- leArquivoVendas
    let listaVendas = getListaVendas stringVendas

    stringProdutos <- leArquivoProdutos
    let listaProdutos = getListaProdutos stringProdutos

    if (existeVenda codigoVenda listaVendas)
        then if (existeProduto codigoProduto listaProdutos)
            then do
                let produtoVenda = getProduto codigoProduto listaProdutos
                let precoUnitario = getPreco produtoVenda
                let totalItemVenda = (precoUnitario * ((100.0 - (fromIntegral percentualDesconto)) / 100.0) * (fromIntegral quantidade))
                writeNewItemVenda (codigoVenda, codigoItem, codigoProduto, precoUnitario, percentualDesconto, quantidade, totalItemVenda)
                adicionarTotalVenda (getVenda codigoVenda listaVendas) totalItemVenda listaVendas
                putStrLn "Venda adicionada.\n"
            else putStrLn "\nProduto Invalido!"
        else putStrLn "\nVenda Invalido!"


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

juntaItensPorProduto :: [ItemVenda] -> [ItemVenda]
juntaItensPorProduto [] = []
juntaItensPorProduto (i:ir) = insereItemPorProduto i (juntaItensPorProduto ir)

insereItemPorProduto :: ItemVenda -> [ItemVenda] -> [ItemVenda]
insereItemPorProduto (_, _, cp1, pu1, pd1, q1, t1) [] = [(1, 0, cp1, pu1, pd1, q1, t1)]
insereItemPorProduto (_, _, cp1, pu1, pd1, q1, t1) ((nv, _, cp2, pu2, pd2, q2, t2):ir)  | (cp1 == cp2) = ((nv + 1), 0, cp1, pu1, 0, (q1 + q2), (t1 + t2)) : ir
                                                                                        | otherwise = (nv, 0, cp2, pu2, pd2, q2, t2) : (insereItemPorProduto (0, 0, cp1, pu1, pd1, q1, t1) ir)
ordenaPorVenda :: [ItemVenda] -> [ItemVenda]
ordenaPorVenda [] = []
ordenaPorVenda (i:ir) = insereItemPorVenda i (ordenaPorVenda ir)

insereItemPorVenda :: ItemVenda -> [ItemVenda] -> [ItemVenda]
insereItemPorVenda i [] = [i]
insereItemPorVenda i (ic:ir)    | ((ItensVenda.getTotal i) >= (ItensVenda.getTotal ic)) = i : (ic:ir)
                                | otherwise = ic : (insereItemPorVenda i ir)

getItensVendaPorVendas :: [ItemVenda] -> [Venda] -> [ItemVenda]
getItensVendaPorVendas [] _ = []
getItensVendaPorVendas (i:ir) v | (estaNasVendas i v) = i : (getItensVendaPorVendas ir v)
                                | otherwise = getItensVendaPorVendas ir v

estaNasVendas :: ItemVenda -> [Venda] -> Bool
estaNasVendas i [] = False
estaNasVendas i (v:vr)  | ((ItensVenda.getCodigoVenda i) == (Vendas.getCodigoVenda v)) = True
                        | otherwise = estaNasVendas i vr

writeNewItemVenda :: ItemVenda -> IO()
writeNewItemVenda i = do
    x <- openFile "itemvenda.db" AppendMode
    hPutStr x (converteItemVendaString i)
    hClose x

converteItemVendaString :: ItemVenda -> String
converteItemVendaString = show

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
    putStrLn ((show codigovenda) ++ " - " ++ (show codigoitem) ++ " - " ++ (show codigoproduto) ++ " - R$" ++ (show precounitario) ++ " - " ++ (show percentualdesconto) ++ "% - " ++ (show quantidade) ++ " - R$" ++ (show $  ((fromInteger $ round $ totalitem * (10^2)) / (10.0^^2))))
