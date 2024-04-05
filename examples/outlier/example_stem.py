import pandas as pd, matplotlib.pyplot as plt
from stemgraphic import stem_graphic
data = r["MASS::Boston"]
# for parameter list see help(stem_graphic)
stem_graphic(data['medv'], scale=4)
plt.show()
plt.close()
