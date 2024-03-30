import numpy as np, pandas as pd, matplotlib.pyplot as plt
boston_df = ghload("Boston", "MASS")
#
boston_df['rad'] = boston_df['rad'].apply(str)
table = pd.value_counts(boston_df['rad'])
fig, ax = plt.subplots()
bars = ax.bar(table.index, table.values, color='skyblue')
ax.set_xlabel('RAD Values'); ax.set_ylabel('Frequency')
ax.set_title('Frequency Distribution of RAD Values')
ax.set_xticks(table.index); ax.set_xticklabels(table.index)
plt.show()
