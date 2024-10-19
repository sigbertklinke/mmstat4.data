import numpy as np
import pandas as pd
iris = r["iris"]
type(iris)
isinstance(iris, pd.DataFrame)
isinstance(iris, pd.DataFrame | np.ndarray)
iris1 = iris.to_numpy()
print(iris1)
iris2 = iris.drop(columns='Species').to_numpy()
print(iris2)
iris.to_dict()
iris.to_dict(orient="list")
