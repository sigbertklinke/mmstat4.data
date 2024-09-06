import pandas as pd, statsmodels.api as sm
from mlxtend.feature_selection import SequentialFeatureSelector as SFS
from sklearn.linear_model import LinearRegression
cps78_85 = r['mmstat4::ghload']("cps.rds")
cps = cps78_85[cps78_85['year'] == 85]
X = sm.add_constant(cps[['educ', 'exper', 'expersq']])
y = cps['lwage']
# Forward : forward=True, floating=False
# Backward: forward=False, floating=False
# Stepwise: forward=True, floating=True
linstep = SFS(LinearRegression(), k_features='best',
              forward=True, floating=False,
              scoring='neg_mean_squared_error', cv=0)
linstep = linstep.fit(X, y)
print(linstep.k_feature_names_)
