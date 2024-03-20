import numpy as np, pandas as pd, matplotlib.pyplot as plt
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
medv_data = boston_df['medv'].values
# Create a histogram with observations (rug plot)
plt.figure(figsize=(10, 6))
plt.hist(medv_data, bins=20, edgecolor='black', alpha=0.7)
plt.title('Histogram with Rug Plot for medv')
plt.xlabel('medv'); plt.ylabel('Frequency')
plt.plot(medv_data, np.zeros_like(medv_data), '|', color='k', 
         markersize=5)
plt.show()
