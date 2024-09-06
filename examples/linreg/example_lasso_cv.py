import numpy as np, pandas as pd
from sklearn.linear_model import LassoCV, Lasso
from sklearn.metrics import mean_squared_error
import matplotlib.pyplot as plt
boston = r["MASS::Boston"]
X = boston.drop(columns=['rad', 'medv'])
y = boston['medv']
lasso_cv = LassoCV(cv=10, random_state=42)
lasso_cv.fit(X, y)
plt.figure()
plt.semilogx(lasso_cv.alphas_, lasso_cv.mse_path_, ":")
plt.plot(lasso_cv.alphas_, lasso_cv.mse_path_.mean(axis=-1))
plt.xlabel('Lambda'); 
plt.ylabel('Mean Squared Error')
plt.title('Lasso Cross-Validation')
plt.axvline(lasso_cv.alpha_, linestyle="--")
plt.show()
