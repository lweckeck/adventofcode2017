import math as m

# Given a spiral like the following, compute the Manhattan distance of a given number
# n to the center (1)
# 17  16  15  14  13
# 18   5   4   3  12  ^
# 19   6   1   2  11  |
# 20   7   8   9  10  |
# 21  22  23  24  25 26
# 
# Squares of uneven numbers are in the bottom right corners of the "levels", squares
# of even numbers one off to the right of the top left corner. 
def distance(n):
    # Find the next greater square number, where base is the root of that square
    base = m.ceil(m.sqrt(n))
    next_square = base**2
    # The diagonal distance to the center is given by half the base, rounded down to the next integer
    radius = m.floor(base/2)

    # The distance of n to the next bottom right or upper left corner along the spiral is...
    dx = next_square - n
    # Since squares of even numbers are one off the corner, correct the distance
    if base % 2 == 0:
        dx += 1
    dy = 0
    # If distance goes "around the corner", compute second dimension of Manhattan distance
    if dx > 2*radius:
        dy = dx % (2*radius)
        dx = 2*radius

    # Compute result from Manhattan distance of n to corner and corner to center
    return abs(dx - radius) - abs(dy - radius)

