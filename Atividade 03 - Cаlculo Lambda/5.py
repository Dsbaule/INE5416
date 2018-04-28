import math

dist = lambda (x1, y1, z1), (x2, y2, z2): math.sqrt(((x1 - x2) ** 2) + ((y1 - y2) ** 2) + ((z1 - z2) ** 2))

x1, y1, z1 = map(int, raw_input("P1 = ").split())
x2, y2, z2 = map(int, raw_input("P1 = ").split())

print (dist)((x1, y1, z1),(x2, y2, z2))
