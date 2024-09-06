import pandas as pd, numpy as np
from sklearn.ensemble import RandomForestClassifier
titanic = r["as.data.frame(Titanic)"]
titanic = titanic.loc[titanic.index.repeat(titanic['Freq'])]
X = pd.get_dummies(titanic[['Class', 'Sex', 'Age']])
rf_class = RandomForestClassifier(n_estimators=100, random_state=42)
rf_class.fit(X, titanic['Survived'])
importances = rf_class.feature_importances_
for feature, importance in zip(X.columns, importances):
    print(f"{feature}: {importance:.4f}")
