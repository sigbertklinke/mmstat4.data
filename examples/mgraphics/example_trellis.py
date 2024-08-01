import pandas as pd, numpy as np
import seaborn as sns, matplotlib.pyplot as plt
Boston = r["MASS::Boston"]
g = sns.FacetGrid(Boston, col='rad', row='chas', margin_titles=True)
g.map(sns.scatterplot, 'lstat', 'medv')
plt.show()
# vertical boxplots with binned continuous variable
lstat = Boston['lstat']
Boston['lstatb'] = pd.cut(lstat, bins=np.arange(0, 41, 10))
#Boston['lstatb'] = pd.cut(lstat, lstat.quantile([0, 0.25, 0.5, 0.75, 1]))
g = sns.FacetGrid(Boston, col='lstatb', col_wrap=4, margin_titles=True)
g.map(sns.boxplot, 'chas', 'medv')
plt.show()
