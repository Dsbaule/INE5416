n = int(input())

D = 0

for i in xrange(n):
    T, V = map(int, raw_input().split())
    D += T * V

print (D)
