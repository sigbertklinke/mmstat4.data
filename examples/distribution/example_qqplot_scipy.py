import matplotlib.pyplot as plt, scipy.stats as stats
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
fig, ax = plt.subplots(figsize=(6, 6))
stats.probplot(boston_df['medv'], dist="norm", plot=ax)
ax.set_title("Quantile-Quantile Plot for medv")
plt.show()
