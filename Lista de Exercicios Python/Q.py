n = input()
G = raw_input()
Q = raw_input()

A = 0

for i in xrange(n):
    if(G[i] == Q[i]):
        A += 1

print(A)
