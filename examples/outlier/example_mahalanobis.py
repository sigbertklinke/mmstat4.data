import pandas as pd, numpy as np, matplotlib.pyplot as plt
from scipy.spatial import distance
data = pd.read_excel("https://tinyurl.com/bdhsbak2/boston.xlsx")
data = data.drop(['crim', 'chas', 'rad'], axis=1)
# Compute the covariance matrix, inverse and mean 
cov_matrix  = np.cov(data.values.T)
cov_inverse = np.linalg.inv(cov_matrix)
mean_vector = data.mean().values
mahalanobis = distance.cdist(data.values, [mean_vector], 
                             'mahalanobis', VI=cov_inverse)
plt.hist(mahalanobis)
plt.show()
plt.close()
