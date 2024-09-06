import matplotlib.pyplot as plt, statsmodels.api as sm
boston_df = r["MASS::Boston"]
#
plt.figure()
sm.qqplot(data, line='s') # 's' for standardized line, '45' for a 45-degree line
plt.title('QQ Plot')
plt.show()
