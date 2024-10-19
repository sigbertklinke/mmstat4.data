import seaborn as sns
import pandas as pd
import matplotlib.pyplot as plt
df = r["MASS::Boston"]
plt.figure(figsize=(8, 6))
sns.scatterplot(data=df, x='lstat', y='medv', color='blue')
plt.xlabel('Lstat')
plt.ylabel('Medv')
plt.title('Boston Housing data')
plt.show()
