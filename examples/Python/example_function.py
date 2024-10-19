import numpy as np

def test(x, y, *args):
    if np.any(np.isnan(x)) or np.any(np.isnan(y)):
        return None
    return x + y

# Test the function
print(test(np.array([7, 3]), np.array([3, 7])))  # Output: [10 10]
print(test(np.array([7, 3]), np.array([3, np.nan])))  # Output: None

# Short-circuit evaluation
def is_true(x):
    return (isinstance(x, bool) and (x is True))
print(is_true)                  # reference to function     
print(is_true(True))            # call to function
print(is_true("hallo, welt")) 
print(is_true(None))
