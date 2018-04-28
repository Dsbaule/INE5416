D = int(input())
A, L, P = map(int, raw_input().split())

if D > A or D > L or D > P:
    print ("N")
else:
    print ("S")
