alunos :: [(Int, String, Float)]
alunos = [(1, "Ana", 3.4), (2, "Bob", 6.7), (3, "Tom", 7.6)]

getNome :: (Int, String, Float) -> String
getNome (a,b,c) = b

getNomes :: [(Int, String, Float)] -> [String]
getNomes [] = []
getNomes (a:b) = getNome a : getNomes b

getPrimeiroAluno :: [(Int, String, Float)] -> (Int, String, Float)
getPrimeiroAluno (a:_) = a

gerarPares :: [String] -> [String] -> [(String, String)] 
gerarPares l1 l2 = [(a,b) | a <- l1, b <- l2, (not (a == b))]

aprovado :: (Int, String, Float) -> Bool
aprovado (a, b, c)  | (c >= 6) = True
                    | otherwise = False

aprovados :: [(Int, String, Float)] -> [String]
aprovados [] = []
aprovados x = (map getNome (filter aprovado x))

aprovados2 :: [(Int, String, Float)] -> [String]
aprovados2 [] = []
aprovados2 (a:b) | (aprovado a) = (getNome a) : aprovados2 b
                 | otherwise = aprovados2 b 

main = do
    print (aprovados alunos)
    print (aprovados2 alunos)
    print (gerarPares (getNomes alunos) (getNomes alunos))