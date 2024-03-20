import numpy as np, pandas as pd, matplotlib.pyplot as plt
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
table = boston_df['rad'].value_counts()
plt.bar(table.index, table.values, color='skyblue')
plt.xlabel('RAD Values')
plt.ylabel('Frequency')
plt.title('Frequency Distribution of RAD Values')
plt.xticks(table.index)
plt.show()
