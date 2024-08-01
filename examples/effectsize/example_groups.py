import pandas as pd
import pingouin as pg
Boston = r['MASS::Boston']
# ANOVA
model = pg.anova(data=Boston, dv='medv', between='rad', effsize="n2")
# Partial Eta-squared
es = model['n2']
print('Eta-squared:', es)
# via pingouin
eta2 = pg.compute_effsize(Boston['medv'], Boston['rad'], eftype='eta-square')
print('Eta-squared:', eta2)
# The results in Python differ from R!
