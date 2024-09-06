import numpy as np
import pandas as pd
import statsmodels.formula.api as smf
from sklearn.preprocessing import StandardScaler
cps78_85 = r['mmstat4::ghload']("cps.rds")
cps    = cps78_85[cps78_85['year'] == 85]
xs     = cps[['lwage', 'educ']]
scaler = StandardScaler()
xs_scaled = pd.DataFrame(scaler.fit_transform(xs), columns=['lwage', 'educ'])
lms = smf.ols('lwage ~ educ', data=xs_scaled).fit()
print(lms.summary())
