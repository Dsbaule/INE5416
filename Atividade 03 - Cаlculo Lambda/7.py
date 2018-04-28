parimpar = lambda x: "par" if ((x % 2) == 0) else "impar"

r = map(parimpar, [1, 2, 2, 3, 4, 5, 5, 6, 7, 8, 9])
print r
