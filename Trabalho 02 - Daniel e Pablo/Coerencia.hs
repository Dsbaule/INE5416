module Coerencia where

-- Importação de Pacotes
import System.IO

-- Importação dos Pacotes Locais
import Clientes
import Produtos
import Vendas
import ItensVenda

--------------------------------------------------------------------------------
---------------------------- Vericação de Coerência ----------------------------
--------------------------------------------------------------------------------

verificaCoerencia :: IO()
verificaCoerencia = do
    -- Inicialização dos dados (listas)
    -- Clientes:
    stringClientes <- leArquivoClientes
    let listaClientes = getListaClientes stringClientes
    -- Produtos:
    stringProdutos <- leArquivoProdutos
    let listaProdutos = getListaProdutos stringProdutos
    -- Vendas:
    stringVendas <- leArquivoVendas
    let listaVendas = getListaVendas stringVendas
    -- Itens de Venda:
    stringItensVenda <- leArquivoItensVenda
    let listaItensVenda = getListaItensVenda stringItensVenda

    putStr "\nVerificação de Coerência: "
    putStrLn $ show (verificaSistema listaVendas listaClientes listaProdutos listaItensVenda)

verificaSistema :: [Venda] -> [Cliente] -> [Produto] -> [ItemVenda] -> Bool
verificaSistema v c p i = (verificaClientes v c) && (verificaItens v p i)

verificaClientes :: [Venda] -> [Cliente] -> Bool
verificaClientes [] _ = True
verificaClientes _ [] = False
verificaClientes (v:vr) c = (temCliente v c) && (verificaClientes vr c)

temCliente :: Venda -> [Cliente] -> Bool
temCliente v [] = False
temCliente v (c:cr) | ((Clientes.getCodigo c) == (Vendas.getCodigoCliente v)) = True
                    | otherwise = temCliente v cr

verificaItens :: [Venda] -> [Produto] -> [ItemVenda] -> Bool
verificaItens [] _ [] = True
verificaItens _ _ [] = False
verificaItens [] _ _ = False
verificaItens v p i = (verificaProdutos i p) && (verificaPrecos v p i) && (verificaItensTemVenda v i)

verificaPrecos :: [Venda] -> [Produto] -> [ItemVenda] -> Bool
verificaPrecos v p i = (verificaPrecosUnitarios i p) && (verificaDescontos i) && (verificaTotal v i)

verificaProdutos :: [ItemVenda] -> [Produto] -> Bool
verificaProdutos [] _ = True
verificaProdutos _ [] = False
verificaProdutos (i:ir) p = (temProduto i p) && (verificaProdutos ir p)

temProduto :: ItemVenda -> [Produto] -> Bool
temProduto i [] = False
temProduto i (p:pr) | ((Produtos.getCodigo p) == (ItensVenda.getCodigoProduto i)) = True
                    | otherwise = temProduto i pr

verificaPrecosUnitarios :: [ItemVenda] -> [Produto] -> Bool
verificaPrecosUnitarios [] _ = True
verificaPrecosUnitarios _ [] = False
verificaPrecosUnitarios (i:ir) p = (verificaPrecoUnitario i p) && (verificaPrecosUnitarios ir p)

verificaPrecoUnitario :: ItemVenda -> [Produto] -> Bool
verificaPrecoUnitario _ [] = False
verificaPrecoUnitario i (p:pr)  | ((Produtos.getCodigo p) == (ItensVenda.getCodigoProduto i)) = comparaPrecoUnitario i p
                                | otherwise = verificaPrecoUnitario i pr

comparaPrecoUnitario :: ItemVenda -> Produto -> Bool
comparaPrecoUnitario i p = (Produtos.getPreco p) == (ItensVenda.getPrecoUnitario i)

verificaDescontos :: [ItemVenda] -> Bool
verificaDescontos [] = True
verificaDescontos (i:ir) = ((abs (((ItensVenda.getPrecoUnitario i) * (fromIntegral (ItensVenda.getQuantidade i)) * ((100.0 - (fromIntegral (ItensVenda.getPercentualDesconto i)))/100.0)) - (ItensVenda.getTotal i))) < 0.01) && (verificaDescontos ir)

verificaTotal :: [Venda] -> [ItemVenda] -> Bool
verificaTotal [] _ = True
verificaTotal (v:vr) i = (verificaTotalVenda v i) && (verificaTotal vr i)

verificaTotalVenda :: Venda -> [ItemVenda] -> Bool
verificaTotalVenda v i = (abs ((Vendas.getTotal v) - (somaTotalVenda v i))) < 0.01

somaTotalVenda :: Venda -> [ItemVenda] -> Float
somaTotalVenda _ [] = 0.0
somaTotalVenda v (i:ir) | ((Vendas.getCodigoVenda v) == (ItensVenda.getCodigoVenda i)) = ItensVenda.getTotal i + (somaTotalVenda v ir)
                        | otherwise = somaTotalVenda v ir

verificaItensTemVenda :: [Venda] -> [ItemVenda] -> Bool
verificaItensTemVenda _ [] = True
verificaItensTemVenda v (i:ir) = (temVenda i v) && (verificaItensTemVenda v ir)

temVenda :: ItemVenda -> [Venda] -> Bool
temVenda i [] = False
temVenda i (v:vr)   | ((ItensVenda.getCodigoVenda i) == (Vendas.getCodigoVenda v)) = True
                    | otherwise = temVenda i vr
