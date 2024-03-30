import statsmodels.api as sm, scipy.stats as ss
import matplotlib.pyplot as plt
boston_df = ghload("Boston", "MASS")
medv = boston_df['medv'] 
# ECDF
ecdf = sm.distributions.ECDF(medv)
print(ecdf)
# Summary
print(ss.describe(medv))
# Plot ECDF
plt.step(ecdf.x, ecdf.y, label='ECDF')
plt.show()
