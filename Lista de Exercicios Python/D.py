n = int(input())
n1, op, n2 = raw_input().split()
n1 = int(n1)
n2 = int(n2)

if op == "+":
    num = n1 + n2
elif op == "*":
    num = n1 * n2

if num <= n:
    print ("OK")
else:
    print ("OVERFLOW")
