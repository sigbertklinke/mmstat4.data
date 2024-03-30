import numpy as np, matplotlib.pyplot as plt
from scipy.stats import multivariate_normal
from sklearn.linear_model import LinearRegression
sig = np.array([[625, 375], [375, 625]])
n = 50
na_type = "mcar"        # mcar, mar, or mnar
na_impute = "condmean"  # delete, mean subst., hot deck, cond. mean, pred. dist.
x = multivariate_normal.rvs(mean=[125, 125], cov=sig, size=n)
plt.figure(); plt.plot(x[:,0], x[:,1], "o", markersize=5)
sw_type = { "mnar": lambda x: x[:, 1] < 140, "mar": lambda x: x[:, 0] < 140, 
            "mcar": lambda x: np.random.rand(n) < 0.6 }
na = sw_type.get(na_type, sw_type["mcar"])(x)
lm = LinearRegression(); lm.fit(x[~na, 0][:, np.newaxis], x[~na, 1])
lp = lm.predict(x[na, 0][:, np.newaxis])
residuals = x[~na, 1] - lm.predict(x[~na, 0][:, np.newaxis])
sw_method = { "delete": np.nan, "mean": np.mean(x[~na, 1]),
              "hotdeck": np.random.choice(x[~na, 1], size=sum(na), replace=True),
              "condmean": lp,
              "preddist": lp+np.random.choice(residuals, size=sum(na), replace=True)}
x[na, 1] = sw_method.get(na_impute, sw_method["delete"])
plt.plot(x[:, 0], x[:, 1], 'ro', markersize=3); plt.show()
