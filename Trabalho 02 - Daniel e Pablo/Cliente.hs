module Cliente where

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

converteStringsClientes :: [String] -> [Cliente]
converteStringsClientes [] = []
converteStringsClientes (c:l) = (converteStringCliente c) : (converteStringsClientes l)

converteStringCliente :: String -> Cliente
converteStringCliente = read

converteClientesStrings :: [Cliente] -> [String]
converteClientesStrings [] = []
converteClientesStrings (c:l) = (converteClienteString c) : (converteClientesStrings l)

converteClienteString :: Cliente -> String
converteClienteString = show
