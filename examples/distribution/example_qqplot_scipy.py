import matplotlib.pyplot as plt, scipy.stats as stats
boston_df = ghload("Boston", "MASS")
#
fig, ax = plt.subplots(figsize=(6, 6))
stats.probplot(boston_df['medv'], dist="norm", plot=ax)
ax.set_title("Quantile-Quantile Plot for medv")
plt.show()
