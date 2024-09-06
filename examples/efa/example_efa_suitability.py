import numpy as np, pandas as pd
from sklearn.preprocessing import StandardScaler
from factor_analyzer import calculate_kmo
from factor_analyzer import calculate_bartlett_sphericity
data = r["mmstat4::ghload"]("data/bfi4.rds")
df = pd.DataFrame(data)
scaled_data = StandardScaler().fit_transform(df)
kmo_all, kmo_model = calculate_kmo(scaled_data)
print("KMO overall statistic:", kmo_model)
print("KMO per variable:", kmo_all)
chi2_statistic, p_value = calculate_bartlett_sphericity(scaled_data)
print("Bartlett's test statistic:", chi2_statistic)
print("p-value:", p_value)
