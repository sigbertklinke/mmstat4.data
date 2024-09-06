import numpy as np, pandas as pd
df = pd.DataFrame([1, 2, pd.NA, None])
print(pd.isna(df))
print(df.dropna())
print(df.mean())
print(pd.isna(np.nan))             # numpy NA
try:
  print(df.mean(skipna=False))
except:
  print("Error!!!")
