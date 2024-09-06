import numpy as np, pandas as pd
from sklearn.preprocessing import StandardScaler
from sklearn.mixture import GaussianMixture
faithful  = r["faithful"]
zfaithful = StandardScaler().fit_transform(faithful)
bic     = [] # BIC for model selection
models  = {} # Store fitted models
n_range = range(1, 10)
for n in n_range:
    models[n] = GaussianMixture(n_components=n, random_state=42)
    models[n].fit(zfaithful)
    bic.append(models[n].bic(zfaithful))
labels = models[n_range[np.argmin(bic)]].predict(zfaithful)
print(labels)
