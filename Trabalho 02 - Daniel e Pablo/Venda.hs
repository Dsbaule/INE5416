module Venda where

-- Importação de Pacotes
import System.IO

import Cliente

-- Produto composto por: Codigo venda, Codigo cliente, Dia, Mes, Ano, Total
type CodigoVenda    = Int
type CodigoCliente  = Int
type Dia            = Int
type Mes            = Int
type Ano            = Int
type Total          = Float

-- Item de venda composto por: Codigo venda, Codigo item, Codigo produto, Preço unitário, Percentual Desconto, Quantidade, Total item
type CodigoItem         = Int
type CodigoProduto      = Int
type PrecoUnitario      = Float
type PercentualDesconto = Int
type Quantidade         = Int
type TotalItem          = Float

type ItemVenda = (CodigoVenda, CodigoItem, CodigoProduto, PrecoUnitario, PercentualDesconto, Quantidade, TotalItem)

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

relatorioDeVendasCompleto :: IO()
relatorioDeVendasCompleto = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nRelatorio de Vendas Completo:"
    putStrLn "\nVendas (Codigo - Nome do Cliente - Data - Total):"
    x <- openFile "venda.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaVendas = converteStringsVendas fLines
    printVendas listaVendas
    putStrLn ("\nValor Total do Faturamento = " ++ (show (getFaturamento listaVendas)))

relatorioDeVendasIntervalo :: IO()
relatorioDeVendasIntervalo = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nRelatorio de Venda por Intervalo:"
    putStrLn "\nData de Inicio:"
    putStr "\tDia = "
    input <- getLine
    let diaInicio = (read input :: Dia)
    putStr "\tMes = "
    input <- getLine
    let mesInicio = (read input :: Mes)
    putStr "\tAno = "
    input <- getLine
    let anoInicio = (read input :: Ano)
    putStrLn "Data de Fim:"
    putStr "\tDia = "
    input <- getLine
    let diaFim = (read input :: Dia)
    putStr "\tMes = "
    input <- getLine
    let mesFim = (read input :: Mes)
    putStr "\tAno = "
    input <- getLine
    let anoFim = (read input :: Ano)
    putStrLn "\nVendas (Codigo - Nome do Cliente - Data - Total):"
    x <- openFile "venda.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaVendas = converteStringsVendas fLines
    let listaVendasIntervalo = getVendasIntervalo listaVendas diaInicio mesInicio anoInicio diaFim mesFim anoFim
    printVendas listaVendasIntervalo
    putStrLn ("\nValor Total do Faturamento = " ++ (show (getFaturamento listaVendasIntervalo)))

relatorioDeVendasCliente :: IO()
relatorioDeVendasCliente = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nRelatorio de Vendas por Cliente:"
    relatorioDeClientes
    putStrLn "Codigo do Cliente = "
    input <- getLine
    let codigoCliente = (read input :: CodigoCliente)
    putStrLn "\nVendas (Codigo - Nome do Cliente - Data - Total):"
    x <- openFile "venda.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaVendas = converteStringsVendas fLines
    let listaVendasCliente = getVendasCliente listaVendas codigoCliente
    printVendas listaVendasCliente
    putStrLn ("\nValor Total do Faturamento = " ++ (show (getFaturamento listaVendasCliente)))

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

printVendas :: [Venda] -> IO()
printVendas [] = putStr ""
printVendas (c:l) = do
    printVenda c
    printVendas l

printVenda :: Venda -> IO()
printVenda (codigovenda, codigocliente, dia, mes, ano, total) = do
    x <- openFile "cliente.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaClientes = converteStringsClientes fLines
    let nomeCliente = getNome (getCliente listaClientes codigocliente)
    putStrLn ((show codigovenda) ++ " - " ++ nomeCliente ++ " - " ++ (show dia) ++ "/" ++ (show mes) ++ "/" ++ (show ano) ++ " - " ++ (show total))

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
