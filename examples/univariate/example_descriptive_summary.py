import pandas as pd, numpy as np
import rpy2, rpy2.robjects.pandas2ri as rop
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
medv_column     = boston_df['medv']
fivenum_values  = np.percentile(medv_column, [0, 25, 50, 75, 100])
describe_result = medv_column.describe()
print("Five-number summary:", fivenum_values)
print("Describe Result:")
print(describe_result)
