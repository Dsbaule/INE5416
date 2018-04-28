numParticipantes, numFolhas, numAvioes = raw_input().split()

numParticipantes = int(numParticipantes)
numFolhas = int(numFolhas)
numAvioes = int(numAvioes)

if numFolhas < numParticipantes * numAvioes:
    print ("N")
else:
    print ("S")
