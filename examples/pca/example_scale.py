import pandas as pd
from sklearn.preprocessing import StandardScaler
bank2 = r['mmstat4::ghload']('bank2.rds')
scaler = StandardScaler()
bank2_scaled = scaler.fit_transform(bank2)
pd.DataFrame(bank2_scaled).describe()
