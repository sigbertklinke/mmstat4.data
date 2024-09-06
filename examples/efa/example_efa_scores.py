import pandas as pd, numpy as np
from factor_analyzer import FactorAnalyzer
bfi2 = r['mmstat4::ghload']('bfi4.rds')
# ML extraction with no rotation
fa1 = FactorAnalyzer(n_factors=5, method='ml', rotation=None)
fa1.fit(bfi2)
scores_fa1 = fa1.transform(bfi2)
print(scores_fa1[:5])
# Min res extraction with oblimin rotation 
fa2 = FactorAnalyzer(n_factors=5, method='minres', rotation='oblimin')
fa2.fit(bfi2)
scores_fa2 = fa2.transform(bfi2)
print(scores_fa2[:5])
print(pd.DataFrame(np.corrcoef(scores_fa1.T, scores_fa2.T)))
