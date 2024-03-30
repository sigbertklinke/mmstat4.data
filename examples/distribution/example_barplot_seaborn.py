import numpy as np, pandas as pd
import matplotlib.pyplot as plt, seaborn as sns
boston_df = ghload("Boston", "MASS")
table = boston_df['rad'].value_counts()
plt.figure()
sns.barplot(x=table.index, y=table)
plt.xlabel('RAD Values'); plt.ylabel('Frequency')
plt.title('Frequency Distribution of RAD Values')
plt.show()
