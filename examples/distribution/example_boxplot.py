import matplotlib.pyplot as plt
boston_df = ghload("Boston", "MASS")
#
plt.figure()
plt.boxplot(x, vert=False)
plt.show()
