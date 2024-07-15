import matplotlib.pyplot as plt
import numpy as np
df = r["MASS::Boston"]
boston['RAD']  = boston['rad'].astype(int)
boston['CHAS'] = boston['chas'].astype(int)
grouped_data = boston.groupby(['RAD', 'CHAS']).size().unstack().fillna(0)
grouped_data_long = grouped_data.stack().reset_index(name='Count')
#
fig, ax = plt.subplots()
sns.barplot(data=grouped_data_long, x='RAD', y='Count', hue='CHAS', ax=ax)
ax.set_ylabel('Counts')
ax.set_xlabel('RAD')
ax.set_title('Counts by RAD and CHAS')
ax.legend(title='CHAS')
plt.show()
