data Ponto = Ponto2D Float Float | Ponto3D Float Float Float

dist :: Ponto -> Ponto -> Float
dist (Ponto2D x1 y1) (Ponto2D x2 y2) = sqrt (((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)))
dist (Ponto3D x1 y1 z1) (Ponto3D x2 y2 z2) = sqrt (((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)) + ((z1 - z2) * (z1 - z2)))

main = do
  print (dist (Ponto3D 0 0 0) (Ponto3D 0 3 6))
