import pandas as pd, numpy as np
import matplotlib.pyplot as plt
from statsmodels.graphics.mosaicplot import mosaic
# data taken from R are read only
data = r['Titanic'] 
# avoid zero counts, e.g. data = np.log(data+1)
# would be possible too
data = data+0.01    
plt.figure(figsize=(6, 6))
# avoid labelling with labelizer
fig = mosaic(data, labelizer=lambda k : None,
             title='Mosaic Plot of Gender and Preference')
plt.show()
