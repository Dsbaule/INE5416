import System.IO

-- Cliente composto por: Codigo,Nome,Cidade,Idade,Sexo
type Codigo = Int
type Nome   = String
type Cidade = String
type Idade  = Int
type Sexo   = Char

type Cliente = (Codigo, Nome, Cidade, Idade, Sexo)

main = do
    stringClientes <- relatorioDeClientes
    printClientes (getClientes stringClientes)

getClientes :: String -> [Cliente]
getClientes stringClientes = converteStringsClientes (lines stringClientes)

relatorioDeClientes :: IO String
relatorioDeClientes = do
    x <- openFile "cliente.db" ReadMode
    hGetContents x

converteStringsClientes :: [String] -> [Cliente]
converteStringsClientes [] = []
converteStringsClientes (c:l) = (converteStringCliente c) : (converteStringsClientes l)

converteStringCliente :: String -> Cliente
converteStringCliente = read

printClientes :: [Cliente] -> IO()
printClientes [] = putStr ""
printClientes (c:l) = do
    printCliente c
    printClientes l

printCliente :: Cliente -> IO()
printCliente (cod, nome, cidade, idade, 'M') = putStrLn ((show cod) ++ " - " ++ nome ++ " - " ++ cidade ++ " - " ++ (show idade) ++ " - " ++ "Masculino")
printCliente (cod, nome, cidade, idade, 'F') = putStrLn ((show cod) ++ " - " ++ nome ++ " - " ++ cidade ++ " - " ++ (show idade) ++ " - " ++ "Feminino")
