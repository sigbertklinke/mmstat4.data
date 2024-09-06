import pandas as pd, numpy as np
from sklearn.tree import DecisionTreeRegressor
from sklearn.metrics import r2_score
from sklearn.model_selection import train_test_split
boston = r["MASS::Boston"]; clfs = []
train, test = train_test_split(boston, test_size=0.2, random_state=42)
X_train = train.drop(columns=['medv']); y_train = train['medv']
X_test  = test.drop(columns=['medv']);  y_test  = test['medv']
model = DecisionTreeRegressor(ccp_alpha=0)
model.fit(X_train, y_train)
print(f'node: {model.tree_.node_count}')
ccpp = model.cost_complexity_pruning_path(X_train, y_train)
for ccp_alpha in ccpp.ccp_alphas:
    clf = DecisionTreeRegressor(random_state=0, ccp_alpha=ccp_alpha)
    clf.fit(X_train, y_train); clfs.append(clf)
r2_scores = [r2_score(y_test, clf.predict(X_test)) for clf in clfs]
optimal_cp =  ccpp.ccp_alphas[np.argmax(r2_scores)]
model = DecisionTreeRegressor(ccp_alpha=optimal_cp)
model.fit(X_train, y_train)
print(f'node: {model.tree_.node_count}')
