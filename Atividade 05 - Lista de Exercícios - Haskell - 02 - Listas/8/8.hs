inverte :: [t] -> [t]
inverte [] = []
inverte (a:b) =  (inverte b) ++ [a] 

main = print (inverte [1, 2, 3])