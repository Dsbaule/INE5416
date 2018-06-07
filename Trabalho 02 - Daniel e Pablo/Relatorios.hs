module Relatorios where

-- Importação de Pacotes
import System.IO

-- Importação dos Pacotes Locais
import Clientes
import Produtos
import Vendas
import ItensVenda

--------------------------------------------------------------------------------
----------------------------- Relatorios de Vendas -----------------------------
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
    stringVendas <- leArquivoVendas
    let listaVendas = getListaVendas stringVendas
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
---------------------------- Relatorios de Produtos ----------------------------
--------------------------------------------------------------------------------

relatorioDeProdutos :: IO()
relatorioDeProdutos = do
    putStrLn "\nProdutos (Codigo - Nome - Quantidade - Preco):"
    stringProdutos <- leArquivoProdutos
    let listaProdutos = getListaProdutos stringProdutos
    printProdutos listaProdutos

relatorioDeProdutosMaisVendidos :: IO()
relatorioDeProdutosMaisVendidos = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nProdutos mais vendidos por Intervalo:"
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

    stringVendas <- leArquivoVendas
    let listaVendas = getListaVendas stringVendas

    stringItensVenda <- leArquivoItensVenda
    let listaItensVenda = getListaItensVenda stringItensVenda

    let listaVendasIntervalo = getVendasIntervalo listaVendas diaInicio mesInicio anoInicio diaFim mesFim anoFim

    let listaItensDeVendaIntervalo = getItensVendaPorVendas listaItensVenda listaVendasIntervalo

    let listaProdutosMaisVendidos = (ordenaPorVenda (juntaItensPorProduto listaItensDeVendaIntervalo))

    stringProdutos <- leArquivoProdutos
    let listaProdutos = getListaProdutos stringProdutos

    putStrLn "\nProdutos mais vendidos (Codigo - Nome - Quantidade - Preço Unitário Médio - Total - Numero de Vendas):"
    printProdutosMaisVendidos listaProdutosMaisVendidos listaProdutos

printProdutosMaisVendidos :: [ItemVenda] -> [Produto] -> IO()
printProdutosMaisVendidos [] p = putStr ""
printProdutosMaisVendidos (i:ir) p = do
    printProdutoVendido i p
    printProdutosMaisVendidos ir p

printProdutoVendido :: ItemVenda -> [Produto] -> IO()
printProdutoVendido i [] = putStrLn ""
printProdutoVendido i (p:pr)    | ((ItensVenda.getCodigoProduto i) == (Produtos.getCodigo p)) = putStrLn ((show $ Produtos.getCodigo p) ++ " - " ++ (Produtos.getNome p)  ++ " - " ++ (show $ ItensVenda.getQuantidade i) ++ " - " ++ (show $  ((fromInteger $ round $ ((ItensVenda.getTotal i)/(fromIntegral $ ItensVenda.getQuantidade i)) * (10^2)) / (10.0^^2)))  ++ " - " ++ (show $ ItensVenda.getTotal i) ++ " - " ++ (show $ ItensVenda.getCodigoVenda i))
                                | otherwise = printProdutoVendido i pr

--------------------------------------------------------------------------------
---------------------------- Relatorios de Clientes ----------------------------
--------------------------------------------------------------------------------

relatorioDeClientes :: IO()
relatorioDeClientes = do
    putStrLn "\nClientes (Codigo - Nome - Cidade - Idade - Sexo):"
    stringClientes <- leArquivoClientes
    let listaClientes = getListaClientes stringClientes
    printClientes listaClientes

relatorioDeClientesQueMaisCompraram :: IO()
relatorioDeClientesQueMaisCompraram = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nClientes que mais compraram por Intervalo:"
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

    stringVendas <- leArquivoVendas
    let listaVendas = getListaVendas stringVendas

    stringClientes <- leArquivoClientes
    let listaClientes = getListaClientes stringClientes

    let listaVendasIntervalo = getVendasIntervalo listaVendas diaInicio mesInicio anoInicio diaFim mesFim anoFim

    let listaDeVendasPorCliente = (ordenaPorFaturamento (juntaVendasPorCliente listaVendasIntervalo))

    putStrLn "\nClientes que mais Compraram (Codigo - Nome - Faturamento):"
    printClientesQueMaisComparam listaDeVendasPorCliente listaClientes

juntaVendasPorCliente :: [Venda] -> [Venda]
juntaVendasPorCliente [] = []
juntaVendasPorCliente (v:vr) = insereVendaPorCliente v (juntaVendasPorCliente vr)

insereVendaPorCliente :: Venda -> [Venda] -> [Venda]
insereVendaPorCliente v [] = [v]
insereVendaPorCliente (_, cc, _, _, _, t) ((_, cc2, _, _, _, t2):vr)    | (cc == cc2) = (0, cc, 0, 0, 0, t + t2) : vr
                                                                        | otherwise = (0, cc2, 0, 0, 0, t2) : (insereVendaPorCliente (0, cc, 0, 0, 0, t) vr)

ordenaPorFaturamento :: [Venda] -> [Venda]
ordenaPorFaturamento [] = []
ordenaPorFaturamento (v:vr) = insereVendaPorFaturamento v (ordenaPorFaturamento vr)

insereVendaPorFaturamento :: Venda -> [Venda] -> [Venda]
insereVendaPorFaturamento v [] = [v]
insereVendaPorFaturamento v (vc:vr) | ((Vendas.getTotal v) >= (Vendas.getTotal vc)) = v : (vc:vr)
                                    | otherwise = vc : (insereVendaPorFaturamento v vr)


printClientesQueMaisComparam :: [Venda] -> [Cliente] -> IO()
printClientesQueMaisComparam [] c = putStr ""
printClientesQueMaisComparam (v:vr) c = do
    printClienteQueComprou v c
    printClientesQueMaisComparam vr c

printClienteQueComprou :: Venda -> [Cliente] -> IO()
printClienteQueComprou v [] = putStrLn ""
printClienteQueComprou v (c:cr) | ((Vendas.getCodigoCliente v) == (Clientes.getCodigo c)) = putStrLn ((show $ Clientes.getCodigo c) ++ " - " ++ (Clientes.getNome c)  ++ " - R$" ++ (show $ Vendas.getTotal v))
                                | otherwise = printClienteQueComprou v cr
