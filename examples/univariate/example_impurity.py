import pandas as pd
boston_df = r["MASS::Boston"]
#
ftab = boston_df['rad'].value_counts()
p = ftab / len(boston_df['rad'])
gini_impurity = sum(p * (1 - p))
print(gini_impurity)
