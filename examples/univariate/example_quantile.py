import numpy as np
def percentile_rank(x, type=7):
    k = 1+np.argsort(x)
    n = len(x)
    formulas = {
        7: k / (n - 1),
        4: k / n,
        5: (k - 0.5) / n,
        6: k / (n + 1),
        8: (k - 1 / 3) / (n + 1 / 3),
        9: (k - 3 / 8) / (n + 1 / 4)
    }
    return formulas.get(type, "unknown or uncomputable type")

x = np.sort(np.random.rand(10))
print(np.quantile(x, [0, 0.25, 0.5, 0.75, 1]))  
print(np.column_stack((x, percentile_rank(x, type=9))))  
