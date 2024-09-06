import pandas as pd
import pingouin as pg
survey = r["MASS::survey"]
# Cohens d
x = survey[survey["Sex"] == "Male"]['Height']
y = survey[survey["Sex"] == "Female"]['Height']
pg.compute_effsize(x, y, eftype='cohen')
pg.compute_effsize(x, y, eftype='hedges')
x = survey[survey["W.Hnd"] == "Left"]['Wr.Hnd']
y = survey[survey["W.Hnd"] == "Right"]['Wr.Hnd']
pg.compute_effsize(x, y, eftype='cohen')
pg.compute_effsize(x, y, eftype='hedges')
