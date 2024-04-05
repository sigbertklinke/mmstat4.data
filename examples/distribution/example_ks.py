import scipy.stats as stats, statsmodels.stats.diagnostic as ssd
Boston <- r["mmstat4::ghload"]("Boston200.rds")
data = boston_df['medv'].dropna()
# Kolmogorov-Smirnov & Lilliefors test 
ks = stats.kstest(data, 'norm', args=(np.mean(data), np.std(data)))
print(ks)
lf = ssd.lilliefors(data)
print(lf)
