import numpy as np
import pandas as pd
from sklearn.cluster import Birch
iris = r['iris[,1:4]']
brc  = Birch(n_clusters=3)
brc.fit(iris)
print(brc.predict(iris))
