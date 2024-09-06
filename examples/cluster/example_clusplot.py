import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from sklearn.cluster import KMeans
iris   = r['iris[,1:4]']
kmeans = KMeans(n_clusters=3, random_state=0)
labels = kmeans.fit_predict(iris)
pca    = PCA(n_components=2)
X_pca  = pca.fit_transform(iris)
plt.figure(figsize=(10, 7))
plt.scatter(X_pca[:, 0], X_pca[:, 1], c=labels,
            cmap='viridis', marker='o')
centers = kmeans.cluster_centers_
centers_pca = pca.transform(centers)
plt.scatter(centers_pca[:, 0], centers_pca[:, 1], c='red', s=300, 
            alpha=0.6, marker='x')
plt.title('Cluster Plot with PCA')
plt.show()
