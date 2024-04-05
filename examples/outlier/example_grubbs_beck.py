import numpy as np,
from outliers import smirnov_grubbs as grubbs
from sklearn.preprocessing import scale

# does not work
def gbs(sx, ind):
    return np.var(sx[ind])/np.var(sx)
def grubbs_beck_test(x, left=True, B=1000, k=2):
    n   = len(x)
    ind = slice(k+1, n) if left else slice(0, n-k)
    vb = [gbs(sorted(np.random.normal(size=n)), ind)  for _ in range(B)]
    v = gbs(sorted(scale(x)), ind)
    return {"statistic": (n - 3) / (n - 1) * v, "p_value": sum(vb <= v) / B}
  
boston_df = r["mmstat4::ghload"]("Boston200.rds")
result = grubbs.test(boston_df['medv'], alpha=0.05)
print(result)
result = grubbs_beck_test(boston_df['medv'], left=False)
print(result)
