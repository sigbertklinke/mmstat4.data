from sklearn.tree import DecisionTreeRegressor
from sklearn.tree import plot_tree, export_text
import matplotlib.pyplot as plt
boston = r["MASS::Boston"]
X = boston[['rm', 'lstat']]
y = boston['medv']
model = DecisionTreeRegressor(min_samples_leaf=48)
model.fit(X, y)
tree_text = export_text(model, feature_names=X.columns)
print(tree_text)
plt.figure(figsize=(30, 20))
plot_tree(model, feature_names=X.columns, filled=True,
          rounded=True, fontsize=6)
plt.show()
