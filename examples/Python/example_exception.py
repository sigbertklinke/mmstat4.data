try:
    result = 10 / 0
except ZeroDivisionError:
    print("Error occurred")
    result = None  # Python's equivalent of NA (Not Available)
except Warning as w:
    print("Warning occurred")
    result = None
finally:
    print("Finally block executed")

print(result)
