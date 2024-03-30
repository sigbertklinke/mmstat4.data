import numpy as np, pandas as pd
from scipy.stats import ttest_1samp
# Load the Boston Housing dataset
boston_df = ghload("Boston200.rds")
#
res = ttest_1samp(boston_df['medv'], popmean=10)
print(res)
