import pandas as pd, numpy as np, pingouin as pg
from scipy.stats import ttest_1samp
Boston = r["MASS::Boston"]
# One sample not available
# Two samples
x = Boston.loc[Boston['chas'] == 0, 'medv']
y = Boston.loc[Boston['chas'] == 1, 'medv']
d_two_samples = pg.compute_effsize(x, y, eftype='cohen')
print('Cohen\'s d (two samples):', d_two_samples)
