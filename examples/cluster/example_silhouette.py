from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_samples
from yellowbrick.cluster import SilhouetteVisualizer
import matplotlib.pyplot as plt
iris = r['iris[,1:4]'].to_numpy()
plt.figure()
kmeans = KMeans(n_clusters=3, random_state=10).fit(iris)
visualizer = SilhouetteVisualizer(kmeans, colors='yellowbrick', 
                                  title="Silhouette plot")
visualizer.fit(iris)
visualizer.show()
print(silhouette_samples(iris, kmeans.fit_predict(iris)))
