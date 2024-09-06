import numpy as np, pandas as pd, matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from scipy.spatial.distance import pdist
from scipy.cluster.hierarchy import linkage, dendrogram
faithful  = r["faithful"]
zfaithful = StandardScaler().fit_transform(faithful)
d   = pdist(zfaithful)
cl1 = linkage(d, method='ward')
plt.figure(figsize=(10, 7))
ddg = dendrogram(cl1)
plt.title('Dendrogram')
plt.ylabel('Distance')
plt.show()
