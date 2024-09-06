import numpy as np
import matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import AgglomerativeClustering
faithful  = r["faithful"]
zfaithful =  StandardScaler().fit_transform(faithful)
cl2       = AgglomerativeClustering(n_clusters=3)
memb2     = cl2.fit_predict(zfaithful)
plt.figure()
plt.scatter(zfaithful[:, 0], zfaithful[:, 1], c=memb2)
plt.title('Agglomerative Clustering')
plt.show()
