data Ponto = Ponto2D (Float, Float) -- Criação do tipo Ponto2D com as coordenadas (x, y)

-- Raciocínio:
-- Para obter o a menor distancia entre 2 pontos do array, é necessário calcular a distancia entre todos, para isso
-- basta pegar o primeiro elemento do array e calcular a distancia com todos os seguintes, repetir o passo para o segundo
-- elemento e assim por diante, logo, é possível realizar o calculo recursivamente através da remoção do primeiro elemento
-- a cada iteração, como é feito na função menorDistanciaEntre

-- Teste de colinearidade utilizando a determinante
colineares :: Ponto -> Ponto -> Ponto -> Bool
colineares (Ponto2D (x1, y1)) (Ponto2D (x2, y2)) (Ponto2D (x3, y3)) = ((x1 * y2) + (y1 * x3) + (x2 * y3) - (y2 * x3) - (y3 * x1) - (y1 * x2)) == 0

-- Calculo da menor distância entre os pontos de um array através da chamada de uma função recursiva (menorDistanciaEntre)
menorDistancia :: [Ponto] -> Float
menorDistancia [] = -1
menorDistancia (a:b) = menorDistanciaEntre (a:b) b

-- Função que itera entre os elementos do array, comparando a distância de todos eles entre si
menorDistanciaEntre :: [Ponto] -> [Ponto] -> Float
menorDistanciaEntre (a:b) [] = menorDistancia b
menorDistanciaEntre (a:b) (c:d) = minDist (distancia a c) (menorDistanciaEntre (a:b) d)

-- Calculo da menor distancia, levando em conta o caso especial onde distancia < 0 devido a comparação invalida
minDist :: Float -> Float -> Float
minDist x y | (x < 0) = y
            | (y < 0) = x
            | (x < y) = x
            | otherwise = y

-- Calculo da distancia entre 2 pontos
distancia :: Ponto -> Ponto -> Float
distancia (Ponto2D (x1, y1)) (Ponto2D (x2, y2)) = sqrt (((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)))

main = do
  print (colineares (Ponto2D (0, 0)) (Ponto2D (1, 1)) (Ponto2D (5, 5)))
  print (colineares (Ponto2D (0, 0)) (Ponto2D (5, 1)) (Ponto2D (1, 5)))
  print (menorDistancia [(Ponto2D (0, 0)), (Ponto2D (5, 0)), (Ponto2D (0, 3))])
  print (menorDistancia [(Ponto2D (0, 0)), (Ponto2D (2, 2)), (Ponto2D (3, 3))])
