fib = lambda n: 0 if n == 0 else 1 if n == 1 else (fib (n - 1)) + (fib (n - 2))

n = int(input())
print (fib)(n)
