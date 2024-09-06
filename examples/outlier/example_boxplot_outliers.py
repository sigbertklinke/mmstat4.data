import numpy as np, seaborn as sns, matplotlib.pyplot as plt
data = np.random.normal(0, 1, 1000)
# Create a boxplot with a rug plot
plt.figure()
sns.boxplot(data, showfliers=True)
sns.rugplot(y=data, color="red", height=0.05)  # Add rug plot
plt.xlabel('Data'); plt.ylabel('Values')
plt.title('Boxplot with Outliers and Rug Plot')
plt.show()
