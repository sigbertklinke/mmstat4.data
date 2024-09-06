import numpy as np
from scipy.stats import gaussian_kde
boston = r["MASS::Boston"]
xmin, xmax = boston['medv'].min() - 1, boston['medv'].max() + 1
ymin, ymax = boston['lstat'].min() - 1, boston['lstat'].max() + 1
# Perform KDE
kde = gaussian_kde(boston['medv'], bw_method='scott')  
x   = np.linspace(xmin, xmax, 1000)
print(kde(x))
# bivariate KDE
kde = gaussian_kde([boston['lstat'], boston['medv']])
# 100j defines a 100x100 grid
X, Y = np.mgrid[xmin:xmax:100j, ymin:ymax:100j]  
positions = np.vstack([X.ravel(), Y.ravel()])
print(kde(positions))
