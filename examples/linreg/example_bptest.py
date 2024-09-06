import pandas as pd
import statsmodels.api as sm
import statsmodels.formula.api as smf
from statsmodels.stats.diagnostic import (
  het_breuschpagan,
  het_white)
staedtemieten = r["mmstat4::ghload"]("staedtemieten.rds")
x  = staedtemieten.dropna()
lm = smf.ols('Miete ~ Fläche', data=x).fit()
X  = sm.add_constant(x['Fläche'])
# second test: F Test (H0: all coeff. equal 0)
print(het_breuschpagan(lm.resid, X))
print(het_white(lm.resid, X))       
