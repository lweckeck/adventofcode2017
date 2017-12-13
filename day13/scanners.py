import sys

s = 0
for line in sys.stdin:
    d, r = map(int, line.split(': '))
    steps = 2 * (r - 1)
    if d % steps == 0:
        s += d * r

print(s)
