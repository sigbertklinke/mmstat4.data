import pandas as pd, numpy as np
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA
from factor_analyzer import FactorAnalyzer
bfi  = r['mmstat4::ghload']("data/bfi4.rds")
data = bfi.iloc[:, :25]
# Principal component extraction
pca = PCA(n_components=5)
pca.fit(data)
print(pca.components_)
# possible are method='ml'/'mle', 'principal', 'uls' or 'minres' (default)
fa = FactorAnalyzer(n_factors=5, method='uls', rotation=None)
fa.fit(data)
print(fa.loadings_)
