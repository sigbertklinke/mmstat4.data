import numpy as np, rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
# Variance and standard deviation
variance = np.var(boston_df['medv'])
std_deviation = np.std(boston_df['medv'])
# Range
data_range = np.ptp(boston_df['medv'])
# Coefficient of variation
coeff_of_variation = std_deviation / np.mean(boston_df['medv'])
#
print("Variance:", variance)
print("Standard Deviation:", std_deviation)
print("Range:", data_range)
print("Coefficient of Variation:", coeff_of_variation)
