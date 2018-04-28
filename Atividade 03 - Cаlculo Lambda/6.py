maior = lambda x, y, z: x if ((x >= z) and (x >= y)) else y if (y >= z) else z

x = int(input("X = "))
y = int(input("Y = "))
z = int(input("Z = "))

print (maior)(x, y, z)
