x = [True, False, None, True, False, None, True, False, None]
y = [True, True, True, False, False, False, None, None, None]
print([a and b for a, b in zip(x, y)])
print(x and y)
print([a or b for a, b in zip(x, y)])
print(x or y)
print([bool(a) != bool(b) for a, b in zip(x, y)])
print([not b for b in y])
# Conditional statements
z = 10
if z > 15:
    print("z is greater than 15")
elif z > 5:
    print("z is greater than 5 but less than or equal to 15")
else:
    print("z is 5 or less")
