import numpy as np
import skfuzzy as fuzz
from sklearn.preprocessing import StandardScaler
df = r['faithful']
scaler = StandardScaler()
df = pd.DataFrame(scaler.fit_transform(df), columns=df.columns)
# Transpose data to fit the input format of skfuzzy's cmeans
df = df.T
# Fuzzy C-Means clustering
n_clusters = 2
cntr, u, u0, d, jm, p, fpc = fuzz.cluster.cmeans(
    df, n_clusters, 2, error=0.005, maxiter=1000)
# Hardening the fuzzy partition to get cluster assignments
cluster_labels = np.argmax(u, axis=0)
print("Cluster centers:", cntr)
print("Membership:", pd.DataFrame(u))
print("Labels:", cluster_labels)
