import sys

def redistribute(bank, index):
    new_bank = list(bank)
    amount = new_bank[index]
    new_bank[index] = 0
    for i in range(index+1, index+1+amount):
        new_bank[i % len(bank)] += 1
    return tuple(new_bank)

for line in sys.stdin:
    bank = tuple(map(int, line.split()))

    configurations = {bank}
    count = 0
    while True:
        argmax = bank.index(max(bank))
        new_bank = redistribute(bank, argmax)
        count += 1
        if new_bank in configurations:
            print(count)
            break
        else:
            configurations.add(new_bank)
            bank = new_bank

