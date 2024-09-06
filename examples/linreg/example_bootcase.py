import pandas as pd, numpy as np
import statsmodels.formula.api as smf
from sklearn.utils import resample
cps78_85 = r['mmstat4::ghload']("cps.rds")
cps = cps78_85[cps78_85['year'] == 85]
lm = smf.ols('lwage ~ educ', data=cps).fit()
def fit_model(data):
  model = smf.ols('lwage ~ educ', data=data).fit()
  return model.params
bootstraps = [fit_model(resample(cps)) for _ in range(1000)]
bootstraps = pd.DataFrame(bootstraps)
summary_stats = bootstraps.describe()
print(summary_stats)
conf_int = bootstraps.quantile([0.025, 0.975])
print(conf_int)
