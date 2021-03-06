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
    input <- getLine
    writeNewCliente (codigo, nome, cidade, idade, sexo)
    putStrLn "Cliente adicionado.\n"

removerCliente :: IO()
removerCliente = do
    putStrLn "\nClientes (Codigo - Nome - Cidade - Idade - Sexo):"
    x <- openFile "cliente.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaClientes = converteStringsClientes fLines
    printClientes listaClientes
    putStrLn "\nCodigo do cliente a remover: "
    input <- getLine
    let codigo = (read input :: Codigo)
    let novaListaClientes = (removeCliente listaClientes codigo)
    printClientes novaListaClientes
    overwriteClientes novaListaClientes

alterarCliente :: IO()
alterarCliente = do
    putStrLn "\nClientes (Codigo - Nome - Cidade - Idade - Sexo):"
    x <- openFile "cliente.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaClientes = converteStringsClientes fLines
    printClientes listaClientes
    putStrLn "\nCodigo do cliente a alterar: "
    input <- getLine
    let codigo = (read input :: Codigo)
    putStrLn "\nDigite os novos dados: "
    putStr "\tNome = "
    input <- getLine
    let nome = (read $ show input :: Nome)
    putStr "\tCidade = "
    input <- getLine
    let cidade = (read $ show input :: Cidade)
    putStr "\tIdade = "
    input <- getLine
    let idade = (read input :: Idade)
    putStr "\tSexo = "
    input <- getChar
    let sexo = input
    input <- getLine
    let novaListaClientes = (removeCliente listaClientes codigo)
    overwriteClientes novaListaClientes
    writeNewCliente (codigo, nome, cidade, idade, sexo)

relatorioDeClientes :: IO()
relatorioDeClientes = do
    putStrLn "\nClientes (Codigo - Nome - Cidade - Idade - Sexo):"
    x <- openFile "cliente.db" ReadMode
    cont <- hGetContents x
    let fLines = lines cont
    let listaClientes = converteStringsClientes fLines
    printClientes listaClientes

--------------------------------------------------------------------------------
------------------------------ Funções Auxiliares ------------------------------
--------------------------------------------------------------------------------

getCliente :: [Cliente] -> Codigo -> Cliente
getCliente ((cod, nome, cidade, idade, sexo):l) codigo  | (cod == codigo) = (cod, nome, cidade, idade, sexo)
                                                        | otherwise = getCliente l codigo

printClientes :: [Cliente] -> IO()
printClientes [] = putStr ""
printClientes (c:l) = do
    printCliente c
    printClientes l

printCliente :: Cliente -> IO()
printCliente (cod, nome, cidade, idade, 'M') = putStrLn ((show cod) ++ " - " ++ nome ++ " - " ++ cidade ++ " - " ++ (show idade) ++ " - " ++ "Masculino")
printCliente (cod, nome, cidade, idade, 'F') = putStrLn ((show cod) ++ " - " ++ nome ++ " - " ++ cidade ++ " - " ++ (show idade) ++ " - " ++ "Feminino")

removeCliente :: [Cliente] -> Codigo -> [Cliente]
removeCliente [] _ = []
removeCliente (a:b) c   | ((getCodigo a) == c) = b
                        | otherwise = a : (removeCliente b c)

overwriteClientes :: [Cliente] -> IO()
overwriteClientes c = do
    x <- openFile "cliente.db" WriteMode
    hPutStr x (converteClientesString c)
    hClose x

writeNewCliente :: Cliente -> IO()
writeNewCliente c = do
    x <- openFile "cliente.db" AppendMode
    hPutStr x (converteClienteString c)
    hClose x

converteStringsClientes :: [String] -> [Cliente]
converteStringsClientes [] = []
converteStringsClientes (c:l) = (converteStringCliente c) : (converteStringsClientes l)

converteStringCliente :: String -> Cliente
converteStringCliente = read

converteClientesString :: [Cliente] -> String
converteClientesString [] = ""
converteClientesString (c:l) = (converteClienteString c) ++ (converteClientesString l)

converteClienteString :: Cliente -> String
converteClienteString (codigo, nome, cidade, idade, sexo) = ("(" ++ (show codigo) ++ "," ++ (show nome) ++ ","  ++ (show cidade) ++ ","  ++ (show idade) ++ ","  ++ (show sexo) ++ ")\n")
