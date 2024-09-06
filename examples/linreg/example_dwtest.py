import pandas as pd
import statsmodels.api as sm
import statsmodels.formula.api as smf
from statsmodels.stats.stattools import durbin_watson
fatalities = r["mmstat4::ghload"]("fatalities.rds")
lm = smf.ols('US ~ YR', data=fatalities).fit()
print(lm.summary())
print(durbin_watson(lm.resid))
