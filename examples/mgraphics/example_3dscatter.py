import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
import numpy as np
Boston  = r["MASS::Boston"]
fig = plt.figure(figsize=(8, 6))
ax  = fig.add_subplot(111, projection='3d')
ax.scatter(Boston['rm'], Boston['lstat'], Boston['medv'], 
           c=Boston['medv'], cmap='viridis', s=10, alpha=0.6)
ax.set_xlabel('rm'); ax.set_ylabel('lstat'); ax.set_zlabel('medv')
ax.set_title('Boston Housing')
plt.show()
