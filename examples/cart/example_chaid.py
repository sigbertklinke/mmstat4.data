import pandas as pd
from CHAID import Tree
titanic    = r["as.data.frame(Titanic)"]
titanic    = titanic.loc[titanic.index.repeat(titanic['Freq'])]
# Define features and target
features = {'Class': 'nominal', 'Sex': 'nominal', 'Age': 'nominal'}
target  = 'Survived'
# Create the CHAID tree
chaid_tree = Tree.from_pandas_df(titanic, features, target)
print(chaid_tree.to_tree())
