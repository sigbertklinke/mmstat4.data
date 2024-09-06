import numpy as np
import matplotlib.pyplot as plt, seaborn as sns
from scipy.stats import gaussian_kde
boston = r["MASS::Boston"]
plt.figure(figsize=(8, 6))
sns.histplot(boston['medv'], kde=True, stat="density", bins=30, 
             color='gray', alpha=0.5)
plt.title('Kernel Density Estimation')
plt.xlabel('medv'); plt.ylabel('Density')
plt.show()
