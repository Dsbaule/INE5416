n = int(input())

num = 0

for i in xrange(n):
    latas, copos = map(int, raw_input().split())

    if latas > copos:
        num += copos

print (num)
