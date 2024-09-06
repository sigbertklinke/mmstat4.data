import numpy as np, pandas as pd
from sklearn.linear_model import Ridge
import matplotlib.pyplot as plt
bhd = r["MASS::Boston"].drop(columns=['rad'])
alphas = np.arange(0.01, 10, 0.01)
# Ridge traces (coefficients for different lambdas)
coefs = []
for alpha in alphas:
    ridge = Ridge(alpha=alpha)
    ridge.fit(bhd.drop(columns='medv'), bhd['medv'])
    coefs.append(ridge.coef_)
# Plot the ridge traces
plt.plot(alphas, coefs)
plt.xlabel("Lambda")
plt.ylabel("Coefficients")
plt.title("Ridge Traces")
plt.show()
