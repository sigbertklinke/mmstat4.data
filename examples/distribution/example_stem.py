import rpy2, rpy2.robjects.pandas2ri as rop
import matplotlib.pyplot as plt, stemgraphic
# Load the Boston Housing dataset
rpy2.robjects.r('library("MASS")')
boston_df = rop.rpy2py(rpy2.robjects.r["Boston"])
#
plt.figure()
stemgraphic.stem_graphic(boston_df['medv'], scale=1)
plt.show()
