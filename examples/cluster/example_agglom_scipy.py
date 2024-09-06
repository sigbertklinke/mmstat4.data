import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from scipy.spatial.distance import pdist
from scipy.cluster.hierarchy import linkage, fcluster
faithful = r["faithful"]
zfaithful =  StandardScaler().fit_transform(faithful)
d     = pdist(zfaithful)
cl1   = linkage(d, method='ward')
memb1 = fcluster(cl1, 3, criterion='maxclust')
plt.figure()
plt.scatter(zfaithful[:, 0], zfaithful[:, 1], c=memb1)
plt.title('Hierarchical Clustering')
plt.show()
