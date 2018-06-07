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

registrarVenda :: IO()
registrarVenda = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nAdicionar venda:"
    putStr "Codigo da Venda = "
    input <- getLine
    let codigoVenda = (read input :: CodigoVenda)
    putStr "Codigo do Cliente = "
    input <- getLine
    let codigoCliente = (read input :: CodigoCliente)
    putStr "Dia = "
    input <- getLine
    let dia = (read input :: Dia)
    putStr "Mes = "
    input <- getLine
    let mes = (read input :: Mes)
    putStr "Ano = "
    input <- getLine
    let ano = (read input :: Ano)

    stringVendas <- leArquivoVendas
    let listaVendas = getListaVendas stringVendas

    stringClientes <- leArquivoClientes
    let listaClientes = getListaClientes stringClientes

    if (existeVenda codigoVenda listaVendas)
        then putStrLn "\nVenda ja Existente!"
        else if (existeCliente codigoCliente listaClientes)
            then do
                writeNewVenda (codigoVenda, codigoCliente, dia, mes, ano, 0.0)
                putStrLn "Venda adicionada.\n"
            else putStrLn "\nCliente Invalido!"

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

converteVendasString :: [Venda] -> String
converteVendasString [] = []
converteVendasString (v:l) = (converteVendaString v) ++ "\n" ++(converteVendasString l)

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

writeNewVenda :: Venda -> IO()
writeNewVenda v = do
    x <- openFile "venda.db" AppendMode
    hPutStr x (converteVendaString v)
    hClose x

existeVenda :: CodigoVenda -> [Venda] -> Bool
existeVenda _ [] = False
existeVenda cv (v:vr) = (cv == (getCodigoVenda v)) || (existeVenda cv vr)

getVenda :: CodigoVenda -> [Venda] -> Venda
getVenda c (v:vr)   | (c == (getCodigoVenda v)) = v
                    | otherwise = getVenda c vr

adicionarTotalVenda :: Venda -> Total -> [Venda] -> IO()
adicionarTotalVenda (cv, cc, d, m, a, t) tn vs = do
    x <- openFile "venda.db" ReadMode
    contents <- hGetContents x
    let novaListaVenda = removeVenda (converteStringVendas contents) cv
    overWriteVendas novaListaVenda
    writeNewVenda (cv, cc, d, m, a, t + tn)

overWriteVendas :: [Venda] -> IO()
overWriteVendas v = do
    x <- openFile "venda.db" WriteMode
    hPutStr x (converteVendasString v)
    hClose x


removeVenda :: [Venda] -> CodigoVenda -> [Venda]
removeVenda [] _ = []
removeVenda (v:vr) c    | ((getCodigoVenda v) == c) = vr
                        | otherwise = v : (removeVenda vr c)

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
