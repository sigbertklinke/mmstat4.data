import pandas as pd, numpy as np
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
# Frequency table / Percentage distribution
frequency = pd.crosstab(index=boston_df['rad'], columns='count')
print(frequency)
percentage = 100*pd.crosstab(index=boston_df['rad'], 
                             columns='percentage', normalize=True)
print(percentage)
# Cumulative frequency table / percentage distribution
cumulative_frequency = frequency.cumsum()
print(cumulative_frequency)
cumulative_percentage = percentage.cumsum()
print(cumulative_percentage)
