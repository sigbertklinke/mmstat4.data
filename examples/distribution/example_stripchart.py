import numpy as np, pandas as pd
import matplotlib.pyplot as plt, seaborn as sns
boston_df = r["MASS::Boston"]
#
plt.figure()
sns.stripplot(boston_df, x="medv")
plt.show()
