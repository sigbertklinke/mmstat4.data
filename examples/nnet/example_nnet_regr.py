import numpy as np, pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import MLPRegressor
from sklearn.metrics import mean_squared_error, mean_absolute_error
boston = r["MASS::Boston"]
trn, tst = train_test_split(boston, test_size=0.2, random_state=42)
X_trn  = trn.drop(columns="medv"); X_tst = tst.drop(columns="medv")
scaler = StandardScaler()
X_trn  = scaler.fit_transform(X_trn)
X_tst  = scaler.transform(X_tst)
mlp = MLPRegressor(hidden_layer_sizes=(20,10), activation='relu',
                   solver='adam', max_iter=1000, random_state=42)
mlp.fit(X_trn, trn['medv']); y_pred = mlp.predict(X_tst)
print(mean_squared_error(tst['medv'], y_pred))
print(mean_absolute_error(tst['medv'], y_pred))
