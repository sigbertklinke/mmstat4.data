import matplotlib.pyplot as plt, seaborn as sns
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
plt.figure()
sns.kdeplot(boston_df['medv'].dropna(), bw_adjust=0.7, label='Kernel Density')
plt.title("Kernel Density Plot for medv")
plt.xlabel("medv"); plt.ylabel("Density")
plt.show()
