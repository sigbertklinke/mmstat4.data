import pandas as pd
import statsmodels.api as sm
import matplotlib.pyplot as plt
boston = r["MASS::Boston"]
X  = sm.add_constant(boston.drop(columns=['medv']))
y  = boston['medv']
lm = sm.OLS(y, X).fit()
influence = lm.get_influence()
cooks_d = influence.cooks_distance[0] # 1 = p-values
plt.figure()
plt.scatter(range(len(cooks_d)), cooks_d, c='blue', s=10, marker='o')
plt.xlabel('Index')
plt.ylabel("Cook's Distance")
n = len(boston); p = X.shape[1]  
plt.axhline(y=4/n, color='red', linestyle='-')
plt.show()
