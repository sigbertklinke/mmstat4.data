import numpy as np, pandas as pd
from sklearn_extra.cluster import KMedoids
from sklearn.preprocessing import StandardScaler
df = r['faithful']
scaler = StandardScaler()
df = pd.DataFrame(scaler.fit_transform(df), columns=df.columns)
# Perform K-Medians clustering
kmedians = KMedoids(n_clusters=2, method='alternate', 
                    metric='manhattan').fit(df)
print("Cluster centers:", kmedians.cluster_centers_)
print("Labels:", kmedians.labels_)
