import sys

scanners = []
for line in sys.stdin:
    d, r = map(int, line.split(': '))
    scanners.append((d,r))

delay = 0
# while delay <= 10:
while True:
    caught = False
    for d, r in scanners:
        steps = 2 * (r - 1)
        if (d + delay) % steps == 0:
            caught = True
            break
    if not caught:
        print(delay)
        break
    delay += h
