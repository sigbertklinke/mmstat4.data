import numpy as np
import pandas as pd
# crosstable
tab = np.matrix('12 6; 6 12')
print(tab)
# crosstable
ctab = pd.DataFrame(tab, columns=["A", "B"], index=["A", "B"])
print(ctab)
# crosstable -> weighted data frame
wtab = ctab.rename_axis(index='index', columns='col').stack()
wtab = wtab.reset_index(name='freq')
print(wtab)
# weighted data frame -> unweighted data matrix
utab = wtab.loc[wtab.index.repeat(wtab.pop('freq'))]
print(utab)
# unweighted data frame -> crosstable
ctab = pd.crosstab(utab['index'], utab['col'])
print(ctab)
