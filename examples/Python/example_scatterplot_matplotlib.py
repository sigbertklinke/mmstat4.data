import pandas as pd
import matplotlib.pyplot as plt
df = r["MASS::Boston"]
plt.figure(figsize=(8, 6))
plt.scatter(df['lstat'], df['medv'], color='blue', marker='o')
plt.xlabel('Medv')
plt.ylabel('Lstat')
plt.title('Boston Housing data')
plt.grid(True)
plt.show()
