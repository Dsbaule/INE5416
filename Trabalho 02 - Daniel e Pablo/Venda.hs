module Venda where

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



--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

--leClientes :: [Cliente]
--leClientes = (converteStringsClientes (leArquivo))
--
--leArquivo :: IO [String]
--leArquivo = do
--    x <- openFile "cliente.db" ReadMode
--    cont <- hGetContents x
--    let fLines = lines cont
--    fLines

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
