N = input()

Matriz1 = []
for i in xrange(N):
    Matriz1.append(map(int, raw_input().split()))
Matriz2 = []
for i in xrange(N):
    Matriz2.append(map(int, raw_input().split()))

for i in xrange(N):
    for j in xrange(N):
        Matriz1[i][j] += Matriz2[i][j];
        print Matriz1[i][j],
    print ""
