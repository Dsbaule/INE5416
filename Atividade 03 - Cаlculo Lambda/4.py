import math

delta = lambda a, b, c: ((b * b) - (4 * a * c))
eq2p = lambda a, b, c: (-b + (math.sqrt((delta)(a, b, c))))/(2 * a)
eq2n = lambda a, b, c: (-b - (math.sqrt((delta)(a, b, c))))/(2 * a)

a = float(input("A = "))
b = float(input("B = "))
c = float(input("C = "))

print "X1 = ", (eq2p)(a, b, c)
print "X2 = ", (eq2n)(a, b, c)
