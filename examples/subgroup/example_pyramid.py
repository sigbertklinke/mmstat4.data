import numpy as np
import matplotlib.pyplot as plt
data = r['MASS::Boston']
ctab = pd.crosstab(data['rad'], df['chas'])
barp = np.arange(len(rad))
fig, ax = plt.subplots(figsize=(8, 6))
ax.barh(barp, ctab[0], height=0.9, align='center', 
        color='blue', label='chas=0')
ax.barh(barp, -ctab[1], height=0.9, align='center', 
        color='pink', label='chas=1')
ax.set_yticks(barp)
ax.set_yticklabels(ctab.index.tolist())
ax.set_title('Population Pyramid')
ax.legend()
plt.show()
