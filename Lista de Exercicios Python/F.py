list = raw_input().split()

for i in xrange(len(list)):
    list[i] = int(list[i])

list.sort()

print(list.pop())
