import numpy as np, pandas as pd, matplotlib.pyplot as plt
boston_df = r["MASS::Boston"]
#
table = boston_df['rad'].value_counts()
plt.bar(table.index, table.values, color='skyblue')
plt.xlabel('RAD Values')
plt.ylabel('Frequency')
plt.title('Frequency Distribution of RAD Values')
plt.xticks(table.index)
plt.show()
