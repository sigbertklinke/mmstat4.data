from sklearn.metrics import (
    adjusted_rand_score, normalized_mutual_info_score, 
    homogeneity_completeness_v_measure,
    silhouette_score, calinski_harabasz_score,
    davies_bouldin_score, fowlkes_mallows_score
)
import numpy as np
iris = r['iris[,1:4]']
true_labels = r['iris$Species']
kmeans = KMeans(n_clusters=3, random_state=42)  
pred_labels = kmeans.fit_predict(iris)
print(adjusted_rand_score(true_labels, pred_labels))
print(normalized_mutual_info_score(true_labels, pred_labels))
print(homogeneity_completeness_v_measure(true_labels, pred_labels))
print(calinski_harabasz_score(iris, pred_labels))
print(davies_bouldin_score(iris, pred_labels))
print(fowlkes_mallows_score(true_labels, pred_labels))
