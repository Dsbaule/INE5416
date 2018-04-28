N, V = map(int, raw_input().split())

VT = float('inf')
V = 0

for i in xrange(N):
    tempo = 0
    voltas = map(int, raw_input().split())
    for volta in voltas:
        tempo += volta
    if (tempo < VT):
        VT = tempo
        V = i + 1

print V
