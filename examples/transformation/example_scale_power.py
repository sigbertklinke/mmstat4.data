import pandas as pd, numpy as np, matplotlib.pyplot as plt
from sklearn.preprocessing import scale
from scipy import stats
df = ghload("Boston", "MASS")
df.describe()
# scale
sccrim = scale(df[['crim']])
np.quantile(sccrim, [0,0.25,0.5,0.75,1])
# Power + Plot
spcrim = stats.boxcox(df['crim'], -0.1)
fig, axs = plt.subplots(1, 2, figsize=(10, 4))
axs[0].hist(df['crim']); axs[0].set_title('crim')
axs[1].hist(spcrim); axs[1].set_title('boxcox(crim, -0.1)')
plt.show()
plt.close()
