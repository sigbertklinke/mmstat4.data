import numpy as np, matplotlib.pyplot as plt
from statsmodels.nonparametric.kernel_regression import KernelReg
from mpl_toolkits.mplot3d import Axes3D
boston = r ["MASS::Boston"]
X      = boston[['lstat', 'rm']]; y = boston['medv']
model  = KernelReg(endog=y, exog=X, var_type='cc', reg_type='lc') 
lstat_range = np.linspace(X['lstat'].min(), X['lstat'].max(), 50)
rm_range    = np.linspace(X['rm'].min(), X['rm'].max(), 50)
lstat_grid, rm_grid = np.meshgrid(lstat_range, rm_range)
X_grid        = np.column_stack([lstat_grid.ravel(), rm_grid.ravel()])
y_hat_grid, _ = model.fit(X_grid)
y_hat_grid = y_hat_grid.reshape(lstat_grid.shape)
fig = plt.figure(figsize=(10, 8))
ax  = fig.add_subplot(111, projection='3d')
ax.plot_surface(lstat_grid, rm_grid, y_hat_grid, cmap='viridis',
                edgecolor='none')
ax.set_xlabel('lstat'); ax.set_ylabel('rm'); ax.set_zlabel('medv')
ax.view_init(elev=30, azim=75)
plt.title('Nadaraya-Watson Surface'); plt.show()
