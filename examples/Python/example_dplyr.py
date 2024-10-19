import pandas as pd
df = r["MASS::Boston"]
df_filtered = (df[df['medv'] < 37]
               .loc[:, ['rm', 'rad', 'lstat', 'medv']]
               .assign(medv1 = df['medv'] * 1000)
               .sort_values(by='medv', ascending=False))
print(df_filtered.head())
df_grouped = df_filtered.groupby('rad'). \
               agg(ave_medv=('medv', 'mean')).reset_index()
print(df_grouped)
