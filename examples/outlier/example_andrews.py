import pandas as pd, matplotlib.pyplot as plt
from pandas.plotting import andrews_curves
data = r["MASS::Boston"]
# any preprocessing must be done beforehand, R rescales on [0, 1]
andrews_curves(data, class_column='rad', colormap='rainbow')
plt.title('Andrews Curves')
plt.show()
plt.close()
