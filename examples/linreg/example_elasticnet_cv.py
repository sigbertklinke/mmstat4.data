import numpy as np, pandas as pd
from sklearn.linear_model import ElasticNetCV
import matplotlib.pyplot as plt
boston = r["MASS::Boston"]
X = boston.drop(columns=['rad', 'medv']); y = boston['medv']
lmenet_cv = ElasticNetCV(l1_ratio=0.5, cv=10, random_state=42)
lmenet_cv.fit(X, y)
mean_mse = lmenet_cv.mse_path_.mean(axis=1)
std_mse = lmenet_cv.mse_path_.std(axis=1)
plt.figure()
plt.semilogx(lmenet_cv.alphas_, mean_mse, ":")
plt.errorbar(lmenet_cv.alphas_, mean_mse, yerr=std_mse, marker='o', 
             linestyle='-', capsize=5)
plt.xlabel('Alpha (lambda)')
plt.ylabel('Mean Squared Error (MSE)')
plt.title('Elastic Net CV Results (Alpha=0.5)')
plt.gca().invert_xaxis() # Invert x-axis to match typical glmnet plots
plt.show()
