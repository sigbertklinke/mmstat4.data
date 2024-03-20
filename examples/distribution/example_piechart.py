import numpy as np, pandas as pd, matplotlib.pyplot as plt
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
tab = boston_df['rad'].value_counts()
plt.figure(figsize=(8, 8))
plt.pie(tab, labels=tab.index, autopct='%1.1f%%', startangle=140)
plt.show()
