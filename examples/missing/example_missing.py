import pandas as pd
allbus2018 = ghload("allbus2018.rds")
vars_starting_with_pt = allbus2018.filter(like="pt")
print(vars_starting_with_pt.isnull().sum())         # NA per col
print(vars_starting_with_pt.isnull().sum(axis=1))   # NA per row
print(vars_starting_with_pt.dropna().shape[0])      # complete cases
non_missing_data = vars_starting_with_pt.dropna()
print(non_missing_data.head())
