import numpy as np, statsmodels.api as sm

def rob_loc (x, M):
  exog = sm.add_constant(np.ones_like(x))
  results = sm.RLM(x, exog, M=M).fit()
  return (results.params.iloc[0])

medv = r["MASS::Boston"]['medv']
res = { 'mean': np.mean(medv), 'median': np.median(medv),
        'huber':  rob_loc(medv, sm.robust.norms.HuberT()),
        'hampel':  rob_loc(medv, sm.robust.norms.Hampel()),
        'andrews': rob_loc(medv, sm.robust.norms.AndrewWave()),
        'tukey':   rob_loc(medv, sm.robust.norms.TukeyBiweight())
       }
print(res)
