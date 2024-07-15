import seaborn as sns
import matplotlib.pyplot as plt
# Example data (replace with your actual data)
data = r['MASS::Boston']
plt.figure(figsize=(8, 6))
sns.kdeplot(data, x='medv', hue='chas', fill=True, common_norm=False)
plt.title('medv densities by chas')
plt.show()
