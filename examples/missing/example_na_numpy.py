import numpy as np, pandas as pd
arr = np.array([1, 2, np.nan, np.inf, np.NINF])
print(np.isnan(arr))              # Check for NaN
print(np.isinf(arr))              # Check for infinity
print(np.ma.masked_invalid(arr))  # Create a masked array
print(np.mean(arr))
print(np.mean(np.ma.masked_invalid(arr)))
print(np.isnan(pd.NA))            # pandas NA


