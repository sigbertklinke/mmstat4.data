import pandas as pd, numpy as np
from autoimpute.imputations import MiceImputer
import statsmodels.formula.api as smf
xmar = ghsource('missing/generate_missing.R', 'xmar')
xmar['chas'] = xmar['chas'].astype('category')
xmar['rad'] = xmar['rad'].astype('category')
# Impute via MICE
imputer = MiceImputer(k=1, return_list=True)
imputed_data = imputer.fit_transform(xmar)
models = []
# Fit models on each imputed dataset
for i in range(5):  # Assuming 5 imputations
    model = smf.ols('medv ~ lstat', data=imputed_data[i][1])
    models.append(model)
# Print summary of the first model
result = models[0].fit()
print(result.summary())
