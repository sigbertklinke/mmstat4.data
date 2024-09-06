from sklearn.preprocessing import StandardScaler
from pyclustering.cluster.kmedians import kmedians
from pyclustering.cluster import cluster_visualizer
import numpy as np
df = r['faithful']
scaler = StandardScaler()
df = pd.DataFrame(scaler.fit_transform(df), columns=df.columns)
# select the starting points
initial = df[:2]
# Create instance of K-Medians algorithm
kmedians = kmedians(df, initial)
kmedians.process()
clusters = kmedians.get_clusters()
medians = kmedians.get_medians()
print("Cluster medians:", medians)
print("Clusters:", clusters)
