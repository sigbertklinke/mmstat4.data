import pandas as pd, numpy as np
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
bank2 = r['mmstat4::ghload']('bank2.rds')
pca = PCA(); pc = pca.fit_transform(bank2)
pev = pca.explained_variance_; pevr = pca.explained_variance_ratio_
colname = [f'PC{i+1}' for i in range(pc.shape[1])]
print(pd.DataFrame(pc, columns=colname))
plt.figure(figsize=(12, 6))
plt.subplot(121)
plt.bar(range(1, pca.n_components_ + 1), pevr, align='center')
plt.xlabel('Principal Component')
plt.ylabel('Prop. of Variance Explained')
plt.title('Scree plot'); plt.grid(True)
plt.subplot(122)
plt.plot(range(1, pca.n_components_ + 1), 
         pev, marker='o', linestyle='-')
plt.xlabel('Principal Component'); plt.ylabel('Eigenvalue')
plt.title('Scree plot'); plt.grid(True)
plt.show()
