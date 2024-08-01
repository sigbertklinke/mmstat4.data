import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
Boston = r['MASS::Boston']
sns.pairplot(Boston)
plt.show()
