import numpy as np, pandas as pd, matplotlib.pyplot as plt
boston_df = r["MASS::Boston"]
#
tab = boston_df['rad'].value_counts()
plt.figure(figsize=(8, 8))
plt.pie(tab, labels=tab.index, autopct='%1.1f%%', startangle=140)
plt.show()
