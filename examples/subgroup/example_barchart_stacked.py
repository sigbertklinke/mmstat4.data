import pandas as pd, statsmodels.api as sm
import matplotlib.pyplot as plt, seaborn as sns
df = r["MASS::Boston"]
df['RAD'] = df['rad'].astype(int)
df['CHAS'] = df['chas'].astype(int)
vmap = {value: idx+1 for idx, value in enumerate(set(df['RAD']))}
df['RAD'] = [vmap[value] for value in df['RAD']]
gd  = df.groupby(['RAD', 'CHAS']).size().unstack().fillna(0)
ind = gd.index
fig, ax = plt.subplots()
sns.set_style("whitegrid")
p1 = ax.bar(ind, gd[0], width=0.75, label='CHAS=0', color='b')
p2 = ax.bar(ind, gd[1], width=0.75, bottom=gd[0], label='CHAS=1', 
            color='r')
ax.set_ylabel('Counts')
ax.set_xlabel('RAD')
ax.set_title('Counts by RAD and CHAS')
ax.legend(title='CHAS')
plt.show()
