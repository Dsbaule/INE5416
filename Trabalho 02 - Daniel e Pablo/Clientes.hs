-- Declaração do módulo
module Clientes where

-- Importações externas
import System.IO    -- Leitura de Arquivos

-- Cliente composto por: Codigo,Nome,Cidade,Idade,Sexo

type Codigo = Int
type Nome   = String
type Cidade = String
type Idade  = Int
type Sexo   = Char

type Cliente = (Codigo, Nome, Cidade, Idade, Sexo)

--------------------------------------------------------------------------------
------------------------------- Funções de Dados -------------------------------
--------------------------------------------------------------------------------

getCodigo :: Cliente -> Codigo
getCodigo (cod, nome, cidade, idade, sexo) =  cod

getNome :: Cliente -> Nome
getNome (cod, nome, cidade, idade, sexo) =  nome

getCidade :: Cliente -> Cidade
getCidade (cod, nome, cidade, idade, sexo) =  cidade

getIdade :: Cliente -> Idade
getIdade (cod, nome, cidade, idade, sexo) =  idade

getSexo :: Cliente -> Sexo
getSexo (cod, nome, cidade, idade, sexo) =  sexo

--------------------------------------------------------------------------------
------------------------------ Funções Principais ------------------------------
--------------------------------------------------------------------------------

getListaClientes :: String -> [Cliente]
getListaClientes stringClientes = converteStringClientes stringClientes

leArquivoClientes :: IO String
leArquivoClientes = do
    x <- openFile "cliente.db" ReadMode
    hGetContents x

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

converteStringClientes :: String -> [Cliente]
converteStringClientes string = converteStringsClientes (lines string)

converteStringsClientes :: [String] -> [Cliente]
converteStringsClientes [] = []
converteStringsClientes (c:l) = (converteStringCliente c) : (converteStringsClientes l)

converteStringCliente :: String -> Cliente
converteStringCliente = read

--------------------------------------------------------------------------------
----------------------- Funções para Impressão de Dados ------------------------
--------------------------------------------------------------------------------

printClientes :: [Cliente] -> IO()
printClientes [] = putStr ""
printClientes (c:l) = do
    printCliente c
    printClientes l

printCliente :: Cliente -> IO()
printCliente (cod, nome, cidade, idade, 'M') = putStrLn ((show cod) ++ " - " ++ nome ++ " - " ++ cidade ++ " - " ++ (show idade) ++ " - " ++ "Masculino")
printCliente (cod, nome, cidade, idade, 'F') = putStrLn ((show cod) ++ " - " ++ nome ++ " - " ++ cidade ++ " - " ++ (show idade) ++ " - " ++ "Feminino")
