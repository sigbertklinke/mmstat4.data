import numpy as np, pandas as pd, scipy.stats as stats
boston_df = r["mmstat4::ghload"]("Boston200.rds")
data = boston_df['rad'].dropna()
#
observed = pd.crosstab(index=data, columns="count")
# Perform chi-squared test
res  = stats.chisquare(observed)
print(res)
