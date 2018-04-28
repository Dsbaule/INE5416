N = input()

tempoAnterior = 0
tempoAtual = 0
tempoTotal = 0


tempoAnterior = input()

for i in xrange(N - 1):
    tempoAtual = input()
    if(tempoAtual >= tempoAnterior + 10):
        tempoTotal += 10
    else:
        tempoTotal += tempoAtual - tempoAnterior
    tempoAnterior = tempoAtual

tempoTotal += 10

print tempoTotal
