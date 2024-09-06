import numpy as np, pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import KMeans
from scipy.cluster.hierarchy import linkage, fcluster
from scipy.spatial.distance import pdist
from sklearn.metrics import confusion_matrix
zfaithful = StandardScaler().fit_transform(r["faithful"])
# Hierarchical clustering
d = pdist(zfaithful)
linkage = linkage(d, method='ward')
memb    = fcluster(linkage, t=3, criterion='maxclust')
# K-means, initial cluster centers from hierarchical clustering
groupm = pd.DataFrame(zfaithful).groupby(memb).mean().values
kmeans = KMeans(n_clusters=3, init=groupm, n_init=1, random_state=42)
kmeans.fit(zfaithful)
tab = confusion_matrix(memb, kmeans.labels_)
print(tab)
