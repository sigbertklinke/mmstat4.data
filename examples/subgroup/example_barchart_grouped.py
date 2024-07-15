import matplotlib.pyplot as plt
import numpy as np
df = r["MASS::Boston"]
boston['RAD']  = boston['rad'].astype(int)
boston['CHAS'] = boston['chas'].astype(int)
gd  = boston.groupby(['RAD', 'CHAS']).size().unstack().fillna(0)
gdl = gd.stack().reset_index(name='Count')
#
fig, ax = plt.subplots()
sns.barplot(data=gdl, x='RAD', y='Count', hue='CHAS', ax=ax)
ax.set_ylabel('Counts')
ax.set_xlabel('RAD')
ax.set_title('Counts by RAD and CHAS')
ax.legend(title='CHAS')
plt.show()
