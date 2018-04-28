
n = input()
celulas = [input() for i in xrange(n)]
quantidade = [0 for i in xrange(n)]

for i in xrange(n):
    if(i > 0):
        quantidade[i] += celulas[i - 1]
    quantidade[i] += celulas[i]
    if(i < n - 1):
        quantidade[i] += celulas[i + 1]

for i in xrange(n):
    print quantidade[i]
