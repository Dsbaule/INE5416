dist :: Float -> Float -> Float -> Float -> Float -> Float -> Float
dist x1 y1 z1 x2 y2 z2 = sqrt (((x1 - x2) * (x1 - x2)) + ((y1 - y2) * (y1 - y2)) + ((z1 - z2) * (z1 - z2)))

main = do
  print "X1 = "
  nString <- getLine
  let x1 = (read nString :: Float)
  print "Y1 = "
  nString <- getLine
  let y1 = (read nString :: Float)
  print "Z1 = "
  nString <- getLine
  let z1 = (read nString :: Float)
  print "X2 = "
  nString <- getLine
  let x2 = (read nString :: Float)
  print "Y2 = "
  nString <- getLine
  let y2 = (read nString :: Float)
  print "Z2 = "
  nString <- getLine
  let z2 = (read nString :: Float)
  print (dist x1 y1 z1 x2 y2 z2)
