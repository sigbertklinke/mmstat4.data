import matplotlib.pyplot as plt, seaborn as sns
boston_df = r["MASS::Boston"]
#
plt.figure()
sns.violinplot(x='rad', y='medv', data=boston_df)
plt.show()
