import numpy as np
import matplotlib.pyplot as plt
from statsmodels.nonparametric.kernel_regression import KernelReg
boston = r ["MASS::Boston"]
X = boston[['lstat', 'rm']]
y = boston['medv']
model = KernelReg(endog=y, exog=X, var_type='cc', reg_type='lc')
y_hat, _ = model.fit(X)
print(y_hat)
