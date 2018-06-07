module Vendas where

-- Importação de Pacotes
import System.IO

import Clientes

-- Produto composto por: Codigo venda, Codigo cliente, Dia, Mes, Ano, Total
type CodigoVenda    = Int
type CodigoCliente  = Int
type Dia            = Int
type Mes            = Int
type Ano            = Int
type Total          = Float

type Venda = (CodigoVenda, CodigoCliente, Dia, Mes, Ano, Total)

--------------------------------------------------------------------------------
------------------------------- Funções de Dados -------------------------------
--------------------------------------------------------------------------------

getCodigoVenda :: Venda -> CodigoVenda
getCodigoVenda (codigovenda, codigocliente, dia, mes, ano, total) = codigovenda

getCodigoCliente :: Venda -> CodigoCliente
getCodigoCliente (codigovenda, codigocliente, dia, mes, ano, total) = codigocliente

getDia :: Venda -> Dia
getDia (codigovenda, codigocliente, dia, mes, ano, total) = dia

getMes :: Venda -> Mes
getMes (codigovenda, codigocliente, dia, mes, ano, total) = mes

getAno :: Venda -> Ano
getAno (codigovenda, codigocliente, dia, mes, ano, total) = ano

getTotal :: Venda -> Total
getTotal (codigovenda, codigocliente, dia, mes, ano, total) = total

--------------------------------------------------------------------------------
------------------------------ Funções Principais ------------------------------
--------------------------------------------------------------------------------

getListaVendas :: String -> [Venda]
getListaVendas = converteStringVendas

leArquivoVendas :: IO String
leArquivoVendas = do
    x <- openFile "venda.db" ReadMode
    hGetContents x

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

converteStringVendas :: String -> [Venda]
converteStringVendas = converteStringsVendas . lines

converteStringsVendas :: [String] -> [Venda]
converteStringsVendas [] = []
converteStringsVendas (v:l) = (converteStringVenda v) : (converteStringsVendas l)

converteStringVenda :: String -> Venda
converteStringVenda = read

converteVendasStrings :: [Venda] -> [String]
converteVendasStrings [] = []
converteVendasStrings (v:l) = (converteVendaString v) : (converteVendasStrings l)

converteVendaString :: Venda -> String
converteVendaString = show

getVendasCliente :: [Venda] -> CodigoCliente -> [Venda]
getVendasCliente [] _ = []
getVendasCliente ((cv, cc, d, m, a, t):l) codigoCliente | (cc == codigoCliente) = (cv, cc, d, m, a, t) : (getVendasCliente l codigoCliente)
                                                        | otherwise = (getVendasCliente l codigoCliente)

getVendasIntervalo :: [Venda] -> Dia -> Mes -> Ano -> Dia -> Mes -> Ano -> [Venda]
getVendasIntervalo [] _ _ _ _ _ _ = []
getVendasIntervalo ((cv, cc, d, m, a, t):l) di mi ai df mf af   | (((a > ai) || ((a == ai) && ((m > mi) || ((m == mi) && (d >= di))))) && ((a < af) || ((a == af) && ((m < mf) || ((m == mf) && (d <= df)))))) = (cv, cc, d, m, a, t) : (getVendasIntervalo l di mi ai df mf af)
                                                                | otherwise = (getVendasIntervalo l di mi ai df mf af)

getFaturamento :: [Venda] -> Float
getFaturamento [] = 0
getFaturamento ((cv, cc, d, m, a, t):l) = t + (getFaturamento l)

--------------------------------------------------------------------------------
----------------------- Funções para Impressão de Dados ------------------------
--------------------------------------------------------------------------------

printVendas :: [Venda] -> IO()
printVendas [] = putStr ""
printVendas (c:l) = do
    printVenda c
    printVendas l

printVenda :: Venda -> IO()
printVenda (codigovenda, codigocliente, dia, mes, ano, total) = do
    putStrLn ((show codigovenda) ++ " - " ++ (show codigocliente) ++ " - " ++ (show dia) ++ "/" ++ (show mes) ++ "/" ++ (show ano) ++ " - " ++ (show total))
