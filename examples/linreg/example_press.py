import numpy as np, pandas as pd
import statsmodels.api as sm
from itertools import accumulate
def cumsum_text(lst, sep="+"):
    return list(accumulate(lst, lambda a, b: f"{a}{sep}{b}"))
boston = r["MASS::Boston"].drop(columns=['chas', 'rad']) 
model  = cumsum_text(boston.columns[:-1].tolist())
def calculate_press(model, data, y):
    X = sm.add_constant(data[model.split('+')])  
    return sm.OLS(data[y], X).fit().get_influence().ess_press
press = {}
for modeli in model:
    press[modeli] = calculate_press(modeli, boston, 'medv')
print(press)
print(min(press, key=press.get))
