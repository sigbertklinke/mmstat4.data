import matplotlib.pyplot as plt, seaborn as sns
boston_df = ghload("Boston", "MASS")
#
plt.figure()
sns.boxplot(x='rad', y='medv', data=boston_df)
plt.show()