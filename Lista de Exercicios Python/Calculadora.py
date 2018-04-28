N = int(input())

n1 = 1
n2 = 0
n3 = 0
n5 = 0
n7 = 0

for i in xrange(N):
    n, op = raw_input().split()
    n = int(n)

    if op == "*":
        if n == 1:
            n1 += 1
        if n == 2:
            n2 += 1
        if n == 3:
            n3 += 1
        if n == 4:
            n2 += 2
        if n == 5:
            n5 += 1
        if n == 6:
            n3 += 2
        if n == 7:
            n7 += 1
        if n == 8:
            n2 += 3
        if n == 9:
            n3 += 2
    else:
        if n == 1:
            n1 -= 1
        if n == 2:
            n2 -= 1
        if n == 3:
            n3 -= 1
        if n == 4:
            n2 -= 2
        if n == 5:
            n5 -= 1
        if n == 6:
            n3 -= 2
        if n == 7:
            n7 -= 1
        if n == 8:
            n2 -= 3
        if n == 9:
            n3 -= 2

print ((1 ** n1) * (2 ** n2) * (3 ** n3) * (5 ** n5) * (7 ** n7))
