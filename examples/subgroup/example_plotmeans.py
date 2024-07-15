import pandas as pd, import numpy as np
import matplotlib.pyplot as plt
from scipy import stats
data = r['MASS::Boston']
dsum = data.groupby('rad')['medv'].agg(['mean', 'count', 'std'])
conf_lvl   = 0.95; z = stats.norm.ppf(1-(1-conf_lvl)/2)
dsum['ci'] = z*dsum['std']/np.sqrt(dsum['count'])
index = np.arange(len(dsum))
plt.figure(figsize=(10, 6))
plt.subplots_adjust(left=0.15, right=0.85, top=0.85, bottom=0.15)
plt.errorbar(index, dsum['mean'], yerr=dsum['ci'], fmt='o', 
    capsize=5, capthick=2, ecolor='red', label='Mean with 95% CI') 
plt.title('Mean Value with 95% CI')
plt.xticks(index, dsum.index); plt.xlabel('rad'); plt.ylabel('medv')
plt.legend(); plt.show()
