import numpy as np, pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import DBSCAN
faithful  = r["faithful"]
zfaithful = StandardScaler().fit_transform(faithful)
# Epsilon values for DBSCAN
eps_values = [0.05, 0.1, 0.15]
for eps in eps_values:
    db = DBSCAN(eps=eps, min_samples=5).fit(zfaithful)
    print(db.labels_)  # -1: noise points
