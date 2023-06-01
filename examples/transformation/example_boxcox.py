import pandas as pd, numpy as np, matplotlib.pyplot as plt
from scipy import stats
data = pd.read_excel("https://tinyurl.com/bdhsbak2/boston.xlsx")
# Power + Plot
bccrim, lbc = stats.boxcox(df["crim"])
yjcrim, lyj = stats.yeojohnson(df["crim"])
fig, axs = plt.subplots(1, 3, figsize=(10,4))
axs[0].hist(df['crim']); axs[0].set_title('crim')
axs[1].hist(bccrim); axs[1].set_title(f"bc(crim, {lbc:.3f})")
axs[2].hist(yjcrim); axs[2].set_title(f"yj(crim, {lyj:.3f})")
for ax in axs:
    ax.tick_params(axis='y', rotation=90, labelsize=8)
plt.show()
plt.close()
