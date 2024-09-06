import pandas as pd
import pingouin as pg
bfi2 = r['mmstat4::ghload']('bfi4.rds')
df   = pd.DataFrame(bfi2.iloc[:, :5])
# Compute Cronbach's Alpha using pingouin
alpha, alpha_ci = pg.cronbach_alpha(df)
print(f"Cronbach's Alpha: {alpha:.3f}")
# compute sum scores
df['sum_score'] = df.sum(axis=1)
df.head()
