import pandas as pd
d  = {'int': [1, 2], 'str': ['a', 'b'], 'bool': [True, False]}
df = pd.DataFrame(d)
df
df.at[0, 'bool']
df.head(1)
df.tail(1)
df.axes
df.index
df.columns
df.info         # attribute
df.info()       # function
