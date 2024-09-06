import numpy as np
import matplotlib.pyplot as plt, seaborn as sns
boston = r["MASS::Boston"]
plt.figure(figsize=(8, 6))
sns.kdeplot(x=boston['lstat'], y=boston['medv'], cmap="Blues", 
            shade=True, bw_adjust=0.5)
plt.title('Bivariate Kernel Density Estimation')
plt.xlabel('lstat'); 
plt.ylabel('medv')
plt.show()
