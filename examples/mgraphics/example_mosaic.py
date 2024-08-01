import pandas as pd
import matplotlib.pyplot as plt
from statsmodels.graphics.mosaicplot import mosaic
data = r['mmstat4::ghload']('data/titanic3.rds')
data['SURVIVED'] = data['survived'].replace(
                   {0: 'Not survived', 1: 'Survived'})
mosaic_data = pd.crosstab(data['SURVIVED'], data['sex'])
fig, _ = mosaic(mosaic_data.stack(), title='Titanic3 data')
plt.show()
