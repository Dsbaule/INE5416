module Main (main) where

import Ponto

main = do
  print (distancia (Ponto2D (1, 2)) (Ponto2D (1,5)))
  print (colineares (Ponto2D (1,2)) (Ponto2D (2,4)) (Ponto2D (3,6)))
  print (colineares (Ponto2D (3,2)) (Ponto2D (2,2)) (Ponto2D (7,-9)))
  print (formaTriangulo (Ponto2D (1,2)) (Ponto2D (2,4)) (Ponto2D (3,6)))
  print (formaTriangulo (Ponto2D (3,2)) (Ponto2D (2,2)) (Ponto2D (7,-9)))
