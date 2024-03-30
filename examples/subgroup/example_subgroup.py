import seaborn as sns
import matplotlib.pyplot as plt
df = ghload("Boston", "MASS")
# Create boxplot with seaborn
plt.figure(figsize=(8, 6))
sns.boxplot(y='medv', x='rad', data=df)
plt.title('Boxplot of Subgroups')
plt.xlabel('rad'); plt.ylabel('medv'); plt.show()
# Calculate the mean of 'Values' within each subgroup
mean_values = df.groupby('rad')['medv'].mean()
print(mean_values)
