import pandas as pd
from sklearn.tree import DecisionTreeClassifier, export_text
titanic = r["as.data.frame(Titanic)"]
titanic = titanic.loc[titanic.index.repeat(titanic['Freq'])]
X = pd.get_dummies(titanic[['Class', 'Sex', 'Age']])
y = titanic['Survived']
fit_default = DecisionTreeClassifier(random_state=42)
fit_default.fit(X, y)
tree_text = export_text(fit_default, feature_names=X.columns)
print(tree_text)
