import numpy as np, pandas as pd
import matplotlib.pyplot as plt, seaborn as sns
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
plt.figure()
sns.stripplot(boston_df, x="medv")
plt.show()
