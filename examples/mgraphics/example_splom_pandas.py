import pandas as pd
import matplotlib.pyplot as plt
from pandas.plotting import scatter_matrix
Boston = r['MASS::Boston']
scatter_matrix(Boston, alpha=0.2, figsize=(10, 10), diagonal='kde')
plt.show()
