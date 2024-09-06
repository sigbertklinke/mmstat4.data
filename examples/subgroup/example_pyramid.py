import numpy as np
import matplotlib.pyplot as plt
data = r['MASS::Boston']
ctab = pd.crosstab(data['rad'], data['chas'])
ctab.index = ctab.index.astype(str)
fig, ax = plt.subplots(figsize=(8, 6))
ax.barh(ctab.index, ctab[0], height=0.9, align='center', 
        color='blue', label='chas=0')
ax.barh(ctab.index, -ctab[1], height=0.9, align='center', 
        color='pink', label='chas=1')
ax.set_yticks(ctab.index)
ax.set_yticklabels(ctab.index.tolist())
ax.set_title('Population Pyramid')
ax.legend()
plt.show()
