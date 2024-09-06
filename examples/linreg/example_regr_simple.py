import pandas as pd
import statsmodels.api as sm
import statsmodels.formula.api as smf
cps78_85 = r['mmstat4::ghload']("cps.rds")
cps = cps78_85[cps78_85['year'] == 85]
lm  = smf.ols('lwage ~ educ', data=cps).fit()
print(lm.summary())
