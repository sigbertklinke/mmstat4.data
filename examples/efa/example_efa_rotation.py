import pandas as pd, numpy as np
import matplotlib.pyplot as plt
from factor_analyzer import FactorAnalyzer
bfi  = r['mmstat4::ghload']("data/bfi4.rds")
data = bfi.iloc[:, :25]
# Default rotation: 'promax'
# Orthogonal rotations: 'varimax', 'oblimax', 'quartimax', 'equamax'
# Oblique rotations: 'promax', 'oblimin', 'quartimin'
fa = FactorAnalyzer(n_factors=5)
fa.fit(data)
print(fa.loadings_)
