N, M = map(int, raw_input().split())
postos = map(int, raw_input().split())

total = 0

for posto in postos:
    if (posto - total > M):
        print('N')
        quit()
    total = posto

print('S')
