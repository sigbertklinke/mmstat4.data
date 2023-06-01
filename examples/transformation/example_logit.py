import pandas as pd, numpy as np
from scipy.special import logit
data = pd.read_excel("https://tinyurl.com/bdhsbak2/boston.xlsx")
indus = data["indus"]/100
# Power + Plot
lindus = logit(indus)
fig, axs = plt.subplots(1, 2, figsize=(10, 4))
axs[0].hist(indus); axs[0].set_title('indus')
axs[1].hist(lindus); axs[1].set_title('logit(indus)')
plt.show()
plt.close()
