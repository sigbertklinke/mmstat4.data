import pandas as pd, numpy as np
import statsmodels.api as sm
from statsmodels.stats.outliers_influence import (
  variance_inflation_factor
)
boston = r['MASS::Boston']
x  = boston.drop(columns=['chas', 'rad', 'medv'])
x  = sm.add_constant(x)  # Add a constant term to the predictors
lm = sm.OLS(boston['medv'], x).fit()
def calculate_vif(exog):
    vif_data = pd.DataFrame()
    vif_data["Variable"] = exog.columns
    vif_data["VIF"] = [variance_inflation_factor(exog.values, i) 
                         for i in range(exog.shape[1])]
    return vif_data
print(calculate_vif(x))
