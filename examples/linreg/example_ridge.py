import numpy as np, pandas as pd
from sklearn.linear_model import Ridge, RidgeCV
bhd = r["MASS::Boston"].drop(columns=['rad'])
alphas = np.arange(0.01, 10, 0.01)
ridge_cv = RidgeCV(alphas=alphas, store_cv_values=True)
ridge_cv.fit(bhd.drop(columns='medv'), bhd['medv'])
print(ridge_cv.alpha_)
ridge_best = Ridge(alpha=ridge_cv.alpha_)
ridge_best.fit(bhd.drop(columns='medv'), bhd['medv'])
print(ridge_best.coef_)
