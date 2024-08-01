import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from pandas.plotting import scatter_matrix
Boston = r['MASS::Boston']
sns.pairplot(Boston)
plt.show()

scatter_matrix(Boston, alpha=0.2, figsize=(10, 10), diagonal='kde')

# Display the plot
plt.show()
