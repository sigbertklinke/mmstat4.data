import pandas as pd
x = pd.Series([1, 2, 3, 4, 5])
print(x)
f = pd.Categorical(x)
print(f)
g = pd.Categorical(x, categories=[1, 2, 3, 4, 5, 6])
print(g)
o = pd.Categorical(x, ordered=True)
print(o)
