import matplotlib.pyplot as plt, stemgraphic
boston_df = ghload("Boston", "MASS")
#
plt.figure()
stemgraphic.stem_graphic(boston_df['medv'], scale=1)
plt.show()
