N, M = map(int, raw_input().split())
postos = map(int, raw_input().split())

resposta = 'S'

for i in range(1, N):
    if ((postos[i] - postos[i - 1]) > M):
        resposta = 'N'
        break

print resposta
