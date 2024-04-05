import pandas as pd
from scipy.stats import chi2_contingency
# Load the Boston Housing dataset
boston_df = r["mmstat4::ghload"]("Boston200.rds")
#
ctab = pd.crosstab(boston_df['chas'], boston_df['rad'])
print(ctab)
res = chi2_contingency(ctab)
print(res)
