import pandas as pd, numpy as np
from scipy.stats import pearsonr, chi2_contingency
Boston = r['mmstat4::ghload']("Boston200.rds")
# correlation
correlation = abs(Boston['medv'].corr(Boston['lstat']))
print('Correlation:', correlation)
# associations
ctab = pd.crosstab(Boston['rad'], Boston['chas'])
n = ctab.sum().sum(); r, c = ctab.shape
chi2, p, dof, ex = chi2_contingency(ctab)
print('Chi-squared test:', chi2, p, dof, ex)
print('Cohen\'s w:', np.sqrt(chi2/n))
cramers_v = np.sqrt(chi2 / (n * (min(ctab.shape) - 1)))
print('Cramér\'s V:', cramers_v)
tschuprows_t = np.sqrt(chi2 / (n * np.sqrt(r*c)))
print('Tschuprow\'s T:', tschuprows_t)
pearsons_c = np.sqrt(chi2 / (chi2 + n))
print('Pearson\'s C:', pearsons_c)
