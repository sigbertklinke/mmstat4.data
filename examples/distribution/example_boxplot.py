import matplotlib.pyplot as plt
boston_df = r["MASS::Boston"]
#
plt.figure()
plt.boxplot(x, vert=False)
plt.show()
