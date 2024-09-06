import numpy as np,  pandas as pd
import matplotlib.pyplot as plt, seaborn as sns
from sklearn.preprocessing import StandardScaler
from sklearn.metrics.pairwise import cosine_similarity
data = r["mmstat4::ghload"]("data/titanic3.rds")
data = data[['pclass', 'survived', 'sex']]
data['sex'] = data['sex'].map({'female': 0, 'male': 1})
data = data.sample(n=50, random_state=1) # Sample 25 obs.
similarity_matrix = cosine_similarity(data)
# Create a heatmap
plt.figure(figsize=(8, 6))
sns.heatmap(similarity_matrix, cmap='viridis', annot=False)
plt.title('Cosine Similarity Heatmap')
plt.show()
