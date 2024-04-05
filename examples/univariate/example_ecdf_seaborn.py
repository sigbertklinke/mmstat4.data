import statsmodels.api as sm, scipy.stats as ss
import matplotlib.pyplot as plt, seaborn as sns
boston_df = r["MASS::Boston"]
# ECDF
plt.figure()
sns.ecdfplot(boston_df, x="medv")
plt.show()
