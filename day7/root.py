import sys

all_nodes = set()
child_nodes = set()

for line in map(str.strip, sys.stdin):
    tokens = line.split(maxsplit=3)
    all_nodes.add(tokens[0])
    if len(tokens) == 4:
        for node in tokens[3].split(', '):
            child_nodes.add(node)

for node in all_nodes - child_nodes:
    print(node)
