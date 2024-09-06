import numpy as np, seaborn as sns, matplotlib.pyplot as plt
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import pairwise_distances
df = r['faithful']
scaler = StandardScaler()
df = pd.DataFrame(scaler.fit_transform(df), columns=df.columns)
df = df.sample(n=25, random_state=1) # Sample 25 obs.
metrics = ['euclidean', 'manhattan', 'cosine', 'chebyshev']
fig, axes = plt.subplots(2, 2, figsize=(5,5), 
                         sharex=True, sharey=True)
axes = axes.flatten() 
for ax, metric in zip(axes, metrics):
    distances = pairwise_distances(df, metric=metric)
    sns.heatmap(distances, ax=ax, cmap='viridis', annot=False)
    ax.set_title(f'{metric}')
plt.show()
