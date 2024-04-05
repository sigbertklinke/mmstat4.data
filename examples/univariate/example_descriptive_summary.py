import pandas as pd, numpy as np
boston_df = r["MASS::Boston"]
#
medv_column     = boston_df['medv']
fivenum_values  = np.percentile(medv_column, [0, 25, 50, 75, 100])
describe_result = medv_column.describe()
print("Five-number summary:", fivenum_values)
print("Describe Result:")
print(describe_result)
