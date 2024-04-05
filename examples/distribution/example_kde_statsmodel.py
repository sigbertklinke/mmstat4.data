import statsmodels.api as sm
import matplotlib.pyplot as plt
boston_df = r["MASS::Boston"]
kde = sm.nonparametric.KDEUnivariate(boston_df['medv'].dropna())
kde.fit()
plt.figure()
plt.plot(kde.support, kde.density, label='Kernel Density')
plt.title("Kernel Density Plot for medv")
plt.xlabel("medv"); plt.ylabel("Density")
plt.show()
