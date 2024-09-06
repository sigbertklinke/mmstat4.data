import numpy as np, pandas as pd
from sklearn.linear_model import Lasso, LassoCV
boston = r["MASS::Boston"]
X = boston.drop(columns=['rad', 'medv']); y = boston['medv']
lasso = Lasso(alpha=10)
lasso.fit(X, y)
print(lasso.coef_)
lasso_cv = LassoCV(cv=10, random_state=42)
lasso_cv.fit(X, y)
print(lasso_cv.coef_)
print(lasso_cv.alpha_)
