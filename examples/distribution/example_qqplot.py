import matplotlib.pyplot as plt, import statsmodels.api as sm
boston_df = ghload("Boston", "MASS")
#
plt.figure()
sm.qqplot(data, line='s') # 's' for standardized line, '45' for a 45-degree line
plt.title('QQ Plot')
plt.show()
