import numpy as np, pandas as pd, matplotlib.pyplot as plt
data = {
  'A': [1, 2, None, 4, 5],
  'B': [6, None, 8, None, 10],
  'C': [11, 12, 13, 14, 15],
  'D': [None, None, None, np.nan, pd.NA]
}
df = pd.DataFrame(data)
# Create a missingness map
plt.imshow(df.isnull(), cmap='binary', aspect='auto')
plt.xticks(range(df.shape[1]), df.columns)
plt.yticks(range(df.shape[0]), range(df.shape[0]))
plt.title('Missingness Map')
plt.show()
plt.close()
