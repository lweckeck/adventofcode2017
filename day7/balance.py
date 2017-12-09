import sys

weights = dict()
children = dict()

# parsing
for line in map(str.strip, sys.stdin):
    tokens = line.split(maxsplit=3)
    node = tokens[0]
    weights[node] = int(tokens[1][1:-1])
    if len(tokens) == 4:
        children[node] = [node for node in tokens[3].split(', ')]
    else:
        children[node] = []

# determine root: only node that occurs in no children list
all_nodes = {node for node in children.keys()}
all_children = {node for childlist in children.values() for node in childlist}
root = list(all_nodes - all_children)[0] # assume root is unique

# recursively compute weight of subtree
def get_weight(node):
    w = weights[node]
    for child in children[node]:
        w += get_weight(child)
    return w

# given a list of values, where at most one deviates from the rest, find its index, else return -1
def deviating_index(ls):
    if len(ls) == 0:
        return -1
    if len(ls) < 3 or (ls[0] != ls[1] and ls[1] == ls[2]): # list too short or first index deviates
        return 0
    for i in range(1, len(ls)):
        if ls[i] != ls[0]:
            return i
    return -1 # no index deviates

# recursively determine which nodes' weight needs to be adjusted
def fix_weight(node, goal=-1):
    children_weights = [get_weight(child) for child in children[node]]
    i = deviating_index(children_weights)
    if i == -1:
        print(node, goal - sum(children_weights), sep='\t')
    else:
        fix_weight(children[node][i], goal=children_weights[(i+1) % len(children_weights)])

fix_weight(root)
