import pandas as pd
import patsy
import statsmodels.api as sm
import statsmodels.formula.api as smf
Boston = r["MASS::Boston"]
model = smf.ols('medv ~ rm + lstat', data=Boston).fit()
print(model.summary())
#
y, X = patsy.dmatrices('medv ~ rm + lstat', data=Boston)
print("Design Matrix X:\n", X)
print("Response Vector y:\n", y)
