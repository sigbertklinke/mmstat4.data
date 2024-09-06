import numpy as np, pandas as pd, matplotlib.pyplot as plt
from sklearn.linear_model import LinearRegression
x  = r["mmstat4::ghload"]("gs50.rds")
df = pd.DataFrame({'V1': x['x'], 'V2': x['ymar']}) 
na = df['V2'].isna()
plt.figure(); plt.plot(x['x'], x['y'], "o", markersize=5)
lm = LinearRegression(); lm.fit(df.loc[~na,['V1']], df.loc[~na,'V2'])
lp = lm.predict(df.loc[~na, ['V1']])
residuals = df.loc[~na, 'V2'] - lp
sw_method = {
    "delete": df.dropna(),  # Actual removal of missing rows
    "mean": df.loc[~na, 'V2'].mean(),
    "hotdeck": np.random.choice(df.loc[~na, 'V2'], size=na.sum(), 
                                replace=True),
    "condmean": lm.predict(df.loc[na, ['V1']]),
    "preddist": condmean_values + np.random.choice(residuals, 
                size=na.sum(), replace=True)
}
df.loc[na, 'V2'] = sw_method["mean"]
plt.plot(df['V1'], df['V2'], 'ro', markersize=3); plt.show()
