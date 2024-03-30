import matplotlib.pyplot as plt, seaborn as sns
boston_df = ghload("Boston", "MASS")
plt.figure()
sns.kdeplot(boston_df['medv'].dropna(), bw_adjust=0.7, 
            label='Kernel Density')
plt.title("Kernel Density Plot for medv")
plt.xlabel("medv"); plt.ylabel("Density")
plt.show()
