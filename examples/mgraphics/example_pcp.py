import pandas as pd
import matplotlib.pyplot as plt
iris = r['iris']
fig = plt.figure(figsize=(8, 6))
pd.plotting.parallel_coordinates(iris, 'Species')
plt.show()
