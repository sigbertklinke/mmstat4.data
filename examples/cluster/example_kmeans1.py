import pandas as pd, matplotlib.pyplot as plt
import sklearn.cluster as sc, sklearn.preprocessing as sp
df     = r['mmstat4::ghload']("data/bank2.rds")
scaler = sp.StandardScaler()
sdata  = pd.DataFrame(scaler.fit_transform(df), columns=df.columns)
kmeans = sc.KMeans(n_clusters=2, random_state=0, init="random")
kx     = kmeans.fit_predict(df)
kz     = kmeans.fit_predict(sdata)
print("Cluster Centers:\n", kmeans.cluster_centers_)
print("Labels:", kmeans.labels_)
