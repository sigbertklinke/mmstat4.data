import pandas as pd
import pingouin as pg
survey = r['MASS::survey']
# Cohens d
x = survey['Height']
y = survey['Sex'].map({'Male': 0, 'Female': 1})
pg.compute_effsize(x, y, eftype='cohen')
pg.compute_effsize(x, y, eftype='hedges')
x = survey['Wr.Hnd']
y = survey['W.Hnd'].map({'Left': 0, 'Right': 1})
pg.compute_effsize(x, y, eftype='cohen')
pg.compute_effsize(x, y, eftype='hedges')
# Results in R and Python differ substantially !
