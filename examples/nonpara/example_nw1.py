import numpy as np
import matplotlib.pyplot as plt
from statsmodels.nonparametric.kernel_regression import KernelReg
boston = r["MASS::Boston"]
X = boston['lstat']; y = boston['medv']
sorted_indices = np.argsort(X)
X = X[sorted_indices]; y = y[sorted_indices]
model = KernelReg(endog=y, exog=X, var_type='c', reg_type='lc')
y_hat, y_std = model.fit(X)
main_title = f'Nadaraya-Watson (h={model.bw[0]:.2f})'
plt.figure(figsize=(8, 6))
plt.scatter(X, y, s=30, color='blue', alpha=0.5, label="Data Points")
plt.plot(X, y_hat, color='red', linewidth=2, label="Fitted Line")
plt.title(main_title); plt.xlabel('lstat'); plt.ylabel('medv')
plt.legend(); plt.show()
