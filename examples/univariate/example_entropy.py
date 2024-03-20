import pandas as pd, scipy.stats as ss
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
ftab = boston_df['rad'].value_counts()
# Calculating entropy
ent  = ss.entropy(ftab)
# Calculating normalized entropy
normalized_ent = ent / len(ftab)
#
print("Entropy:", ent)
print("Normalized Entropy:", normalized_ent)
