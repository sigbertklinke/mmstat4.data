from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import MLPClassifier
from sklearn.metrics import classification_report, confusion_matrix
titanic = r["as.data.frame(Titanic)"]
titanic = titanic.loc[titanic.index.repeat(titanic['Freq'])]
trn, tst = train_test_split(titanic, test_size=0.2, random_state=42)
X_trn = pd.get_dummies(trn[['Class', 'Sex', 'Age']])
X_tst = pd.get_dummies(tst[['Class', 'Sex', 'Age']])
mlp = MLPClassifier(hidden_layer_sizes=10, activation='relu', 
                    solver='adam', max_iter=500, random_state=42)
mlp.fit(X_trn, trn['Survived'])
y_pred = mlp.predict(X_tst)
conf_matrix = confusion_matrix(tst["Survived"], y_pred)
print(conf_matrix)
print(classification_report(tst["Survived"], y_pred))
