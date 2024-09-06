import pandas as pd
import statsmodels.api as sm
import matplotlib.pyplot as plt
boston = r["MASS::Boston"]
X = sm.add_constant(boston.drop(columns=['medv']))
y = boston['medv']
lm = sm.OLS(y, X).fit()
hat_values = lm.get_influence().hat_matrix_diag
plt.figure()
plt.scatter(range(len(hat_values)), hat_values, c='blue', 
            s=10, marker='o')
plt.title('Leverage'); plt.xlabel('Index')
plt.ylabel('Hat Values')
n = len(boston); p = X.shape[1]  # includes the constant term
for i, color in enumerate(['black', 'darkred', 'red']):
    plt.axhline(y=(i+1)*(p)/n, color=color, linestyle='-')
plt.show()
