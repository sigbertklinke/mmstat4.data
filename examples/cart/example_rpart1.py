from sklearn.tree import DecisionTreeRegressor
from sklearn.tree import plot_tree, export_text
import matplotlib.pyplot as plt
boston = r["MASS::Boston"]
X = boston.drop(columns=['medv'])
y = boston['medv']
model = DecisionTreeRegressor(max_depth=1)
model.fit(X, y)
tree_text = export_text(model, feature_names=X.columns)
print(tree_text)
plt.figure(figsize=(20, 10))
plot_tree(model, feature_names=X.columns, filled=True,
          rounded=True, fontsize=10)
plt.show()
