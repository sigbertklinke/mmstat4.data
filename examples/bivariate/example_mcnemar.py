import numpy as np, statsmodels.stats.contingency_tables as ssc
# Define the contingency table
tab = np.array([[8, 16], [5, 11]])

# Perform McNemar's test
result = ssc.mcnemar(tab, exact=False, correction=True)
print(result)
