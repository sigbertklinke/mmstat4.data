import numpy as np, pandas as pd
from sklearn.linear_model import ElasticNetCV, ElasticNet
boston = r["MASS::Boston"]
X = boston.drop(columns=['rad', 'medv']); y = boston['medv']
lmenet = ElasticNet(alpha=1.0, l1_ratio=0.5, random_state=42)
lmenet.fit(X, y)
print(lmenet.coef_)
lmenet_cv = ElasticNetCV(l1_ratio=0.5, cv=10, random_state=42)
lmenet_cv.fit(X, y)
print(lmenet_cv.alpha_)
print(lmenet_cv.l1_ratio_)
