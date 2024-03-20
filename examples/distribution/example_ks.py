import scipy.stats as stats, statsmodels.stats.diagnostic as ssd
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
data = boston_df['medv'].dropna()
# Kolmogorov-Smirnov & Lilliefors test 
ks = stats.kstest(data, 'norm', args=(np.mean(data), np.std(data)))
print(ks)
lf = ssd.lilliefors(data)
print(lf)
