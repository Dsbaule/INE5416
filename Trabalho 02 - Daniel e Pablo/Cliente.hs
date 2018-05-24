module Cliente where

import System.IO

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

relatorioDeClientes :: IO()
relatorioDeClientes = do
    putStrLn "\nClientes (Codigo - Nome - Cidade - Idade - Sexo):"
    x <- openFile "cliente.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaClientes = converteStringsClientes fLines
    printClientes listaClientes
    putStrLn "\n"

adicionarCliente :: IO()
adicionarCliente = do
    hSetBuffering stdout NoBuffering
    putStrLn "\nAdicionar cliente:"
    putStr "\nCodigo = "
    input <- getLine
    let codigo = (read input :: Codigo)
    putStr "Nome = "
    input <- getLine
    let nome = (read $ show input :: Nome)
    putStr "Cidade = "
    input <- getLine
    let cidade = (read $ show input :: Cidade)
    putStr "Idade = "
    input <- getLine
    let idade = (read input :: Idade)
    putStr "Sexo = "
    input <- getChar
    let sexo = input
    putStrLn "\n"
    writeNewCliente (codigo, nome, cidade, idade, sexo)
    putStrLn "Cliente adicionado.\n\n"

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

printClientes :: [Cliente] -> IO()
printClientes [] = putStr ""
printClientes (c:l) = do
    printCliente c
    printClientes l

printCliente :: Cliente -> IO()
printCliente (cod, nome, cidade, idade, 'M') = putStrLn ((show cod) ++ " - " ++ nome ++ " - " ++ cidade ++ " - " ++ (show idade) ++ " - " ++ "Masculino")
printCliente (cod, nome, cidade, idade, 'F') = putStrLn ((show cod) ++ " - " ++ nome ++ " - " ++ cidade ++ " - " ++ (show idade) ++ " - " ++ "Feminino")

writeNewCliente :: Cliente -> IO()
writeNewCliente c = do
    x <- openFile "cliente.db" AppendMode
    hPutStrLn x (converteClienteString c)
    hClose x

converteStringsClientes :: [String] -> [Cliente]
converteStringsClientes [] = []
converteStringsClientes (c:l) = (converteStringCliente c) : (converteStringsClientes l)

converteStringCliente :: String -> Cliente
converteStringCliente = read

converteClientesStrings :: [Cliente] -> [String]
converteClientesStrings [] = []
converteClientesStrings (c:l) = (converteClienteString c) : (converteClientesStrings l)

converteClienteString :: Cliente -> String
converteClienteString (codigo, nome, cidade, idade, sexo) = ("(" ++ (show codigo) ++ "," ++ (show nome) ++ ","  ++ (show cidade) ++ ","  ++ (show idade) ++ ","  ++ (show sexo) ++ ")")
