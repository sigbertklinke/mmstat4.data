import pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
data = r['mmstat4::ghload']("bank2.rds")
df   = pd.DataFrame(data)
# Correlation
scaler = StandardScaler(with_mean=True, with_std=True)
scaled_data = scaler.fit_transform(df)
pca = PCA()
pca.fit(scaled_data)
print(pca.explained_variance_ratio_)
print(pca.explained_variance_)
# Covariance
pca.fit(data)
print(pca.explained_variance_ratio_)
print(pca.explained_variance_)
